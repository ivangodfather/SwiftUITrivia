//
//  Question.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct Question: Codable {
    let category: Category
    let type: QuestionType
    let difficulty: Difficulty
    let title: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    private enum CodingKeys: String, CodingKey {
        case category
        case type
        case difficulty
        case title = "question"
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum QuestionType: String, Codable {
    case multiple
    case boolean
}

enum Difficulty: String, Codable, CaseIterable {
    case easy
    case medium
    case hard
}
