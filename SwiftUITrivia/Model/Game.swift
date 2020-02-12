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
    var questions: [Question] = []
    
    @Published
    var score = 0
    
    func getQuestions() {
        questions = QuestionLoader.questions()
    }
    
    
}
