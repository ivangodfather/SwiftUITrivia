//
//  ContentView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game = Game()
    
    var body: some View {
        VStack {
            HStack {
                Text("Score")
                Text(game.score.description)
            }
            content
            .foregroundColor(Color.a)
            .font(.largeTitle)

        }
    }
    
    private var content: some View {
        switch game.gameState {
        case .loading:
            return AnyView(EmptyView())
        case .started(let currentQuestion):
            return AnyView(QuestionView(question: currentQuestion, didSelectAnswer: { answer in
                self.game.didSelect(answer: answer)
            }))
        case .finished:
            return AnyView(ResultView(score: game.score))
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
