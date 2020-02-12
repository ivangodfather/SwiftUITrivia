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
            Text(game.score.description)
            QuestionView(question: game.currentQuestion, didSelectAnswer: { answer in
                self.game.didSelect(answer: answer)
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
