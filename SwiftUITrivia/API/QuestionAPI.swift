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
    
    private let urlString = "https://opentdb.com/api.php"
    
    func fetch(amount: Int = 10) -> AnyPublisher<[Question], Never> {
        var urlComponents = URLComponents(string: urlString)!
        let queryItem = URLQueryItem(name: "amount", value: amount.description)
        urlComponents.queryItems = [queryItem]
        return URLSession.shared
            .dataTaskPublisher(for: urlComponents.url!)
            .map { $0.data }
            .decode(type: QuestionsResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .eraseToAnyPublisher()
        
    }
}
