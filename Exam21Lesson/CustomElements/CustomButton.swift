//
//  CustomButton.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 09.10.2024.
//

import UIKit

class CustomButton: UIButton {
    var nameInstance: String?
    
    init(text: String, buttonColor: UIColor, textColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: text, buttonColor: buttonColor, textColor: textColor)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup Button
extension CustomButton {
    
    private func setupButton(text: String, buttonColor: UIColor, textColor: UIColor) {
        setTitle(text, for: .normal)
        backgroundColor = buttonColor
        setTitleColor(textColor, for: .normal)
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 5, height: 5)
        
        widthAnchor.constraint(equalToConstant: 100).isActive = true
        heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

//MARK: - Setup Layout
extension CustomButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 15)
        layer.shadowPath = shadowPath.cgPath
    }
}
