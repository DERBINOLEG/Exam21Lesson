//
//  FindImageViewController.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 18.02.2025.
//

import UIKit

class FindImageViewController: UIViewController {
    
    
    
    //    MARK: - UI Elements
    private let topLabel: UILabel = {
        $0.text = "Введите название картинки"
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private let textField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .roundedRect
        $0.placeholder = "Название картинки"
        return $0
    }(UITextField())
    
    lazy var button: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Проверить", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addAction(UIAction { _ in
            self.setImage()
        }, for: .touchUpInside)
        return $0
    }(UIButton())
    
    private let findImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    //    MARK: - Properties
    
    var narutoData: IDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //    MARK: - Methods
    private func setImage() {
        let text = textField.text ?? ""
        let model = narutoData?.findModel(forFind: text)
        if let model {
            findImage.image = UIImage(named: model.imageName)
            topLabel.text = "Такая картинка есть!"
        } else {
            topLabel.text = "Такой картинки нет!"
        }
        textField.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setImage()
    }
}

//MARK: - SetupUI
extension FindImageViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(topLabel)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(findImage)
        textField.delegate = self
        setupLayout()
    }
}

//MARK: - SetupLayout
extension FindImageViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 50),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            findImage.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 50),
            findImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            findImage.heightAnchor.constraint(equalTo: findImage.widthAnchor),
            findImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}

//MARK: - UITextFieldDelegate

extension FindImageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setImage()
        return true
    }
}
