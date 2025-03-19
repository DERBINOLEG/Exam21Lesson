//
//  CustomView.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 19.03.2025.
//

import UIKit

class CustomView: UIView {
//    MARK: - UIElements
    private let characterImage = UIImageView()
    private let characterName = UILabel()
    private let descriptionLabel = UILabel()
    private let markButtun = UIButton()
//    MARK: - Properties
    private var toggleMark = false
    var action: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.2) {
            self.setupAnimation(withAnimation: true)
        } completion: { _ in
            self.setupAnimation()
        }

    }
    
    func configure(character: NarutoModel) {
        characterImage.image = UIImage(named: character.imageName)
        characterName.text = character.imageName
        descriptionLabel.text = character.description
        toggleMark = character.isMark
        let mark = character.isMark ? "checkmark.square.fill" : "checkmark.square"
        markButtun.setImage(UIImage(systemName: mark), for: .normal)
    }
}
//MARK: SetupUI
private extension CustomView {
    func setupUI() {
        setupAnimation()
        [
            characterImage,
            characterName,
            descriptionLabel,
            markButtun
        ].forEach {
            addSubview($0)
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
        markButtun.addAction(UIAction {_ in
            self.toggleMark.toggle()
            let mark = self.toggleMark ? "checkmark.square.fill" : "checkmark.square"
            self.markButtun.setImage(UIImage(systemName: mark), for: .normal)
            self.action?()
        }, for: .touchUpInside)
    }
    func setupAnimation(withAnimation: Bool = false) {
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        layer.cornerRadius = 20
        if withAnimation {
            backgroundColor = .gray
            layer.shadowOffset = CGSize(width: 2, height: 2)
        } else {
            backgroundColor = .yellow
            layer.shadowOffset = CGSize(width: 5, height: 5)
        }
    }
}
//MARK: - SetupLayout
private extension CustomView {
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
            characterImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            characterName.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            characterName.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 6),
            descriptionLabel.leadingAnchor.constraint(equalTo: characterName.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            markButtun.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            markButtun.centerYAnchor.constraint(equalTo: characterName.centerYAnchor),
            markButtun.heightAnchor.constraint(equalToConstant: 40),
            markButtun.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}

