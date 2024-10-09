//
//  UIStackView+AddSubviews.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 09.10.2024.
//

import UIKit

extension UIStackView {
    func addSequenceSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
