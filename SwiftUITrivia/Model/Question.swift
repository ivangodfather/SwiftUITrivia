//
//  Question.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct Question {
    let category: String
    let type: QuestionType
    let difficulty: Difficulty
    let title: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}

enum QuestionType {
    case multiple
    case boolean
}

enum Difficulty {
    case easy
    case medium
    case hard
}

class QuestionGenerator {
    static let shared = QuestionGenerator()
    
    func randomQuestion() -> Question {
        Question(category: "Cinema", type: .multiple, difficulty: .medium, title: "Capital of Australia", correctAnswer: "Canberra", incorrectAnswers: ["Sidney", "Melbourne", "London"])
    }
    
}
