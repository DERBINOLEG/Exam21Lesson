//
//  LicenseAgreementViewController.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 01.03.2025.
//

import UIKit

class LicenseAgreementViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let label: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "LICENSED APPLICATION END USER LICENSE AGREEMENT"
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var text: UILabel = {
        $0.numberOfLines = 0
        $0.text = textManager.getText()
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    var textManager: TextManager
    
    init(textManager: TextManager) {
        self.textManager = textManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - SetupUI
extension LicenseAgreementViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(label)
        scrollView.addSubview(text)
        setupLayout()
    }
}

//MARK: - SetupLayout
extension LicenseAgreementViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            label.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            text.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            text.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            text.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
    }
}
