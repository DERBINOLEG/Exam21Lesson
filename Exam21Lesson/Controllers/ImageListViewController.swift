//
//  ImageListViewController.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 04.03.2025.
//

import UIKit

class ImageListViewController: UIViewController {
//    MARK: UIElements
    private let charactersTable = UITableView()
//    MARK: Propeties
    var dataManager: IDataManager!
    private let identifierCell = "characterCell"
//    MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - SetupViews
extension ImageListViewController {
    private func setupView() {
        view.addSubview(charactersTable)
        setupCharacterTable()
        setupLayout()
    }
    private func setupCharacterTable() {
        charactersTable.dataSource = self
        charactersTable.delegate = self
        charactersTable.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell )
    }
}
//MARK: - Setup Layout
extension ImageListViewController {
    private func setupLayout() {
        charactersTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            charactersTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charactersTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            charactersTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            charactersTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension ImageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataManager.narutoCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        var config = cell.defaultContentConfiguration()
        let character = dataManager.narutoCharacters[indexPath.row]
        config.image = UIImage(named: character.imageName)
        config.text = character.title
        config.textProperties.font = UIFont.systemFont(ofSize: 12)
        config.imageProperties.maximumSize = CGSize(width: 100, height: 100)
        cell.contentConfiguration = config
        cell.selectionStyle = .none
        if dataManager.narutoCharacters[indexPath.row].isMark {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}
//MARK: - UITableViewDelegate
extension ImageListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete") { _, _, completion in
                self.dataManager.removeCharacter(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                completion(true)
            }
        let markAction = UIContextualAction(
            style: .normal,
            title: "Mark") { _, _, completion in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = self.dataManager.narutoCharacters[indexPath.row].isMark ? .checkmark : .none
                self.dataManager.changeMark(index: indexPath.row)
                tableView.reloadRows(at: [indexPath], with: .automatic)
                completion(true)
            }
        markAction.backgroundColor = .green
        let config = UISwipeActionsConfiguration(actions: [deleteAction, markAction])
        return config
    }
}
