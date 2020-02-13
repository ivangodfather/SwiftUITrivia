//
//  struct QuestionBank.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import Combine

enum GameState {
    case loading
    case started(currentQuestion: Question)
    case finished
}

final class Game: ObservableObject {
    
    @Published var score = 0
    @Published var gameState: GameState = .loading
    
    private var questions: [Question] = []
    private var cancellableSet = Set<AnyCancellable>()

    
    init() {
        let questions = QuestionAPI().fetch()
            .receive(on: RunLoop.main)
        
        questions
            .compactMap { $0.first }
            .map { GameState.started(currentQuestion: $0) }
            .eraseToAnyPublisher()
            .assign(to: \.gameState, on: self)
            .store(in: &cancellableSet)
        
        questions.assign(to: \.questions, on: self)
            .store(in: &cancellableSet)
    }
    
    
    func nextQuestion() {
        guard let question = questions.first else {
            gameState = .finished
            return
        }
        gameState = .started(currentQuestion: question)
    }
    
    func didSelect(answer: String) {
        if questions.first?.correctAnswer == answer {
            score += 1
        }
        questions.remove(at: 0)
        nextQuestion()
    }
    
    
}
