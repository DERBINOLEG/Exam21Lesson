//
//  NarutoModel.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 09.10.2024.
//

import Foundation

struct NarutoModel {
    let imageName: String
    let title: String
}

//MARK: - Comparable
extension NarutoModel: Comparable {
    static func < (lhs: NarutoModel, rhs: NarutoModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}

//MARK: - CustomStringConvertible
extension NarutoModel: CustomStringConvertible {
    var description: String {
        "Название картинки: \(imageName), описание: \(title)"
    }
}
