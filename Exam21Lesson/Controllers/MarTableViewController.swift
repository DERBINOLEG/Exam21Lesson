//
//  MarTableViewController.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 05.03.2025.
//

import UIKit

class MarTableViewController: UITableViewController {
    var dataManager: IDataManager!
    private let cellIdentifire = "cellIdentifire"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CharacterCell.self, forCellReuseIdentifier: cellIdentifire)
    }
    
    private func setupAction(cell: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let character = dataManager.returnMarkCharacters()[indexPath.row]
            if let index = dataManager.narutoCharacters.firstIndex(of: character) {
                dataManager.changeMark(index: index)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        dataManager.returnMarkCharacters().count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifire,
            for: indexPath
        ) as? CharacterCell else {
            return UITableViewCell()
        }
        let markCharacter = dataManager.returnMarkCharacters()[indexPath.row]
        cell.configure(character: markCharacter)
        cell.action = setupAction(cell:)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
