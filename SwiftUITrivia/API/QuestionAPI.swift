//
//  QuestionAPI.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 13/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import Combine

class QuestionAPI {
    
    private let urlString = "https://opentdb.com/api.php?amount=30"
    
    func fetch() -> AnyPublisher<[Question], Never> {
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: urlString)!)
            .map { $0.data }
            .decode(type: QuestionsResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .eraseToAnyPublisher()
        
    }
}
