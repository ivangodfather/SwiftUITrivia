//
//  QuestionLoader.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation


class QuestionLoader {
    static let shared = QuestionLoader()
    
    static func randomQuestion() -> Question {
        return questions().randomElement()!
    }
    
    static func questions() -> [Question] {
        if let url = Bundle.main.url(forResource: "questions", withExtension: "json") {
          do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(QuestionsResponse.self, from: data) as QuestionsResponse
            return response.results
          } catch {
            print("error: \(error)")
          }
        }
        return []
    }

}

struct QuestionsResponse: Codable {
    let results: [Question]
}
