//
//  ViewController.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 09.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let verticalStackView = UIStackView()
    private let imageCharacter = UIImageView()
    private let characterInfoLabel = UILabel()
    private let horizontalStackView = UIStackView()
    private let lastButton = CustomButton(text: "Last", buttonColor: .blue, textColor: .white)
    private let nextButton = CustomButton(text: "Next", buttonColor: .white, textColor: .black)
    private let firstButton = CustomButton(text: "First", buttonColor: .red, textColor: .white)
    private let narutoData = NarutoDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc
    private func nextButtonTapped() {
        let character = narutoData.nextCharacter()
        let image = UIImage(named: character.imageName)
        imageCharacter.image = image
        characterInfoLabel.text = character.description
    }


}

//MARK: Setup View
private extension ViewController {
    func setupUI() {
        view.addGradient()
        view.addSubview(verticalStackView)
        view.addSubview(firstButton)
        setupVerticalStackView()
        setupImageCharacter()
        setupInfoLabel()
        setupHorizontalStackView()
        addActions()
        setupLayout()
    }
    
    func setupVerticalStackView() {
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 15
        verticalStackView.alignment = .center
        verticalStackView.distribution = .fill
        
        verticalStackView.addSequenceSubviews(
            imageCharacter,
            characterInfoLabel,
            horizontalStackView
        )
    }
    
    func setupImageCharacter() {
        let image = UIImage(named: narutoData.getCharacter().imageName)
        imageCharacter.image = image
        imageCharacter.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageCharacter.layer.shadowOpacity = 0.7
    }
    
    func setupInfoLabel() {
        characterInfoLabel.text = narutoData.getCharacter().description
        characterInfoLabel.numberOfLines = 0
        characterInfoLabel.textAlignment = .center
        characterInfoLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
    }
    
    func setupHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillProportionally
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 50
        
        horizontalStackView.addSequenceSubviews(lastButton, nextButton)
    }
    
    func addActions() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        lastButton.addAction(UIAction { _ in
            let character = self.narutoData.lastCharacter()
            self.imageCharacter.image = UIImage(named: character.imageName)
            self.characterInfoLabel.text = character.description
        }, for: .touchUpInside)
        firstButton.addAction(UIAction { _ in
            let character = self.narutoData.firstCharacter()
            if let character {
                self.imageCharacter.image = UIImage(named: character.imageName)
                self.characterInfoLabel.text = character.description
            }
        }, for: .touchUpInside)
    }
}

//MARK: Setup Layout
private extension ViewController {
    func setupLayout() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            verticalStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.8),
            verticalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            imageCharacter.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor, multiplier: 0.7),
            imageCharacter.heightAnchor.constraint(equalTo: imageCharacter.widthAnchor),
            
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
    }
}

#Preview {
    ViewController()
}

