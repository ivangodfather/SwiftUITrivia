//
//  ContentView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var game = Game()
    @EnvironmentObject var gameSettings: GameSettings
    
    var body: some View {
        VStack {
            content
        }.onAppear {
            self.game.gameSettings = self.gameSettings
        }
    }
    
    private var content: some View {
        switch game.gameState {
        case .loading:
            return AnyView(LoadingView(isAnimating: .constant(true),
                                       style: .large)).id("loading")
        case .started(let currentQuestion):
            return AnyView(QuestionView(question: currentQuestion) { answer in
                self.game.didSelect(answer: answer)
            }).id("questionView")
        case .finished:
            return AnyView(ResultView(score: game.score,
                                      game: game)).id("finished")
        case .initial:
            return AnyView(InitialView(game: game)).id("initial")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
