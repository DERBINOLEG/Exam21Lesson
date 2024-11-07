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
    
    var narutoData: IDataManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        lastButton.delegate = self
        nextButton.delegate = self
        firstButton.delegate = self
        setupUI()
        
        print(view.countViews(lastButton, nextButton, firstButton))
        view.printViewName(lastButton, nextButton, firstButton)
    }
    
    @objc
    private func nextButtonTapped() {
        let character = narutoData?.nextCharacter()
        let image = UIImage(named: character?.imageName ?? "")
        imageCharacter.image = image
        characterInfoLabel.text = character?.title
    }
    
    @objc
    private func lastButtonTapped() {
        let character = narutoData?.nextCharacter()
        let image = UIImage(named: character?.imageName ?? "")
        imageCharacter.image = image
        characterInfoLabel.text = character?.title
    }
    
    @objc
    private func firstButtonTapped() {
        let character = narutoData?.nextCharacter()
        let image = UIImage(named: character?.imageName ?? "")
        imageCharacter.image = image
        characterInfoLabel.text = character?.title
    }


}

//MARK: Setup View
private extension ViewController {
    func setupUI() {
        view.addGradient()
        view.addSubview(verticalStackView)
        view.addSubview(firstButton)
        setupButtons()
        setupVerticalStackView()
        setupImageCharacter()
        setupInfoLabel()
        setupHorizontalStackView()
        setupLayout()
    }
    
    func setupButtons() {
        lastButton.nameInstance = "lastButton"
        nextButton.nameInstance = "nextButton"
        firstButton.nameInstance = "firstButton"
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
        let image = UIImage(named: narutoData?.getCharacter().imageName ?? "")
        imageCharacter.image = image
        imageCharacter.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageCharacter.layer.shadowOpacity = 0.7
    }
    
    func setupInfoLabel() {
        characterInfoLabel.text = narutoData?.getCharacter().title
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

//MARK: - ICustomButtonDelegate
extension ViewController: ICustomButtonDelegate {
    func buttonPressed(_ button: UIButton) {
        switch button {
        case nextButton:
            nextButtonTapped()
        case lastButton:
            let character = self.narutoData?.lastCharacter()
            self.imageCharacter.image = UIImage(named: character?.imageName ?? "")
            self.characterInfoLabel.text = character?.title
        case firstButton:
            let character = self.narutoData?.firstCharacter()
            if let character {
                self.imageCharacter.image = UIImage(named: character.imageName)
                self.characterInfoLabel.text = character.title
            }
            default:
                break
        }
    }
}

#Preview {
    ViewController()
}

