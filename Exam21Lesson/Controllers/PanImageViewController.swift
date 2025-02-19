//
//  PanImageViewController.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 19.02.2025.
//

import UIKit

class PanImageViewController: UIViewController {
    
    //    MARK: UIElements
    private let narutoImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(resource: .NARUTO)
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    //    MARK: Properties
    var narutoData: IDataManager?
    private var centerX: NSLayoutConstraint!
    private var centerY: NSLayoutConstraint!
    private var panGestureAnchorPoint: CGPoint?
    
    //    MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    //    MARK: Methods
    @objc
    private func handlePanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            panGestureAnchorPoint = gestureRecognizer.location(in: view)
        case .changed:
            guard let panGestureAnchorPoint else { return }
            let gesturePoint = gestureRecognizer.location(in: view)
            centerX.constant += gesturePoint.x - panGestureAnchorPoint.x
            centerY.constant += gesturePoint.y - panGestureAnchorPoint.y
            self.panGestureAnchorPoint = gesturePoint
        case .ended, .cancelled:
            panGestureAnchorPoint = nil
        case .failed, .possible:
            break
        @unknown default:
            break
        }
    }
    
}

//MARK: - SetupUI
extension PanImageViewController {
    private func setupUI() {
        view.addSubview(narutoImage)
        setupLayout()
        setupGestureRecognizers()
    }
    
    private func setupGestureRecognizers() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        narutoImage.addGestureRecognizer(panGestureRecognizer)
    }
}

//MARK: - SetupLayout
extension PanImageViewController {
    private func setupLayout() {
        centerX = narutoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        centerY = narutoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        
        NSLayoutConstraint.activate([
            centerX,
            centerY,
            narutoImage.heightAnchor.constraint(equalToConstant: 100),
            narutoImage.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
}
