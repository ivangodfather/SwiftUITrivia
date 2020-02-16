//
//  struct QuestionBank.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import Combine
import AudioToolbox

enum GameState {
    case initial
    case loading
    case started(currentQuestion: Question)
    case finished
}

final class Game: ObservableObject {
    
    @Published var score = 0
    @Published var gameState: GameState = .initial
    var gameSettings = GameSettings()

    private var questions: [Question] = []
    private var cancellableSet = Set<AnyCancellable>()
    
    func startGame() {
        gameState = .loading
        score = 0
        fetchQuestions()
    }
    
    func reset() {
        gameState = .initial
    }
    
    func didSelect(answer: String) {
        let isCorrect = questions.first?.correctAnswer == answer
        if isCorrect {
            score += 1
        }
        if gameSettings.enableSound {
            playSound(note: isCorrect ? "correct" : "wrong")
        }
        questions.remove(at: 0)
        nextQuestion()
    }
    
    private func fetchQuestions() {
        let questions = QuestionAPI()
            .fetch(amount: gameSettings.numberOfQuestions)
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
    
    
    private func nextQuestion() {
        guard let question = questions.first else {
            gameState = .finished
            return
        }
        gameState = .started(currentQuestion: question)
    }
    
    func playSound(note : String) {
        var soundURL: NSURL?
        var soundID: SystemSoundID = 0

        let filePath = Bundle.main.path(forResource: note, ofType: "wav")
        soundURL = NSURL(fileURLWithPath: filePath!)
        if let url = soundURL {
            AudioServicesCreateSystemSoundID(url, &soundID)
            AudioServicesPlaySystemSound(soundID)
        }
    }

}
