//
//  NarutoDataManager.swift
//  Exam21Lesson
//
//  Created by Олег Дербин on 09.10.2024.
//

import Foundation

class NarutoDataManager {
    private var narutoCharacters: [NarutoModel] = []
    private var narutoManager = NarutoManager()
    private var index = 0
    
    init() {
        self.narutoCharacters = narutoManager.getNarutosCharacters()
    }
    
    func getCharacter() -> NarutoModel {
        narutoCharacters[index]
    }
    
    func nextCharacter() -> NarutoModel {
        if index < narutoCharacters.count - 1 {
            index += 1
        }
        return getCharacter()
    }
    
    func lastCharacter() -> NarutoModel {
        if index > 0 {
            index -= 1
        }
        return getCharacter()
    }
    
    func firstCharacter() -> NarutoModel? {
        var character: NarutoModel?
        if !narutoCharacters.isEmpty {
            character = narutoCharacters.first!
            index = 0
        }
        return character
    }
}
