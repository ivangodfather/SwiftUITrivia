//
//  struct QuestionBank.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import Combine

final class Game: ObservableObject {
    
    @Published
    var questions: [Question] = QuestionLoader.questions()
    
    @Published
    var currentQuestion: Question!
    
    @Published
    var score = 0
    
    init() {
        currentQuestion = questions.first
    }
    
    
    @discardableResult
    func nextQuestion() -> Question? {
        guard !questions.isEmpty else {
            return nil
        }
        currentQuestion = questions.remove(at: 0)
        return currentQuestion
    }
    
    func didSelect(answer: String) {
        if currentQuestion?.correctAnswer == answer {
            score += 1
        }
        nextQuestion()
    }
    
    
}
