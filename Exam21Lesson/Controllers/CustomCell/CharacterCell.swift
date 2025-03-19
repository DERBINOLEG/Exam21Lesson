//
//  CharacterCell.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 05.03.2025.
//

import UIKit

class CharacterCell: UITableViewCell {
//    MARK: - UIElements
    private let customView = CustomView()
//    MARK: - Propeties
    var action: ((UITableViewCell) -> ())?
//    MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Methods
    func configure(character: NarutoModel) {
        customView.configure(character: character)
        customView.action = toggleMarkButton
    }
    private func toggleMarkButton() {
        action?(self)
    }
}
//MARK: SetupUI
private extension CharacterCell {
    func setupUI() {
        contentView.backgroundColor = .systemPink
        contentView.addSubview(customView)
        setupLayout()
    }
}
//MARK: - SetupLayout
private extension CharacterCell {
    func setupLayout() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
