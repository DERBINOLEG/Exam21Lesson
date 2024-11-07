//
//  UIView+Extensions.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 07.11.2024.
//

import UIKit

extension UIView {
    func countViews(_ views: UIView...) -> Int {
        var count = 0
        views.forEach { view in
            guard let _ = view as? CustomButton else { return }
            count += 1
        }
        return count
    }
    
    func printViewName(_ views: UIView...) {
        views.forEach { view in
            guard let button = view as? CustomButton else { return }
            print(button.nameInstance ?? "Unowned name")
        }
    }
}
