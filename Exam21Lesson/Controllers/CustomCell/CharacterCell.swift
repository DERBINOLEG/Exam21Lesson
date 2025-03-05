//
//  CharacterCell.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 05.03.2025.
//

import UIKit

class CharacterCell: UITableViewCell {
    private let characterImage = UIImageView()
    private let characterName = UILabel()
    private let descriptionLabel = UILabel()
    private let markButtun = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(character: NarutoModel) {
        characterImage.image = UIImage(named: character.imageName)
        characterName.text = character.imageName
        descriptionLabel.text = character.description
        markButtun.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
    }
}
//MARK: SetupUI
private extension CharacterCell {
    func setupUI() {
        [
            characterImage,
            characterName,
            descriptionLabel,
            markButtun
        ].forEach {
            contentView.addSubview($0)
        }
        setupImage()
        setupNameLabel()
        setupDescriptionLabel()
        setupButton()
        setupLayout()
    }
    func setupImage() {
        characterImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        characterImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        characterImage.contentMode = .scaleAspectFill
    }
    func setupNameLabel() {
        characterName.font = .boldSystemFont(ofSize: 20)
    }
    func setupDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
    }
    func setupButton() {
        markButtun.tintColor = .systemBlue
    }
}
//MARK: - SetupLayout
private extension CharacterCell {
    func setupLayout() {
        [
            characterImage,
            characterName,
            descriptionLabel,
            markButtun
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            characterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            characterName.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            markButtun.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            markButtun.centerYAnchor.constraint(equalTo: characterName.centerYAnchor),
            markButtun.heightAnchor.constraint(equalToConstant: 40),
            markButtun.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
