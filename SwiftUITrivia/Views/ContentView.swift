//
//  ContentView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var question: Question
    
    var body: some View {
        ZStack {
            BackgroundImageQuestion(question: question)
            VStack {
                Text(question.title)
                    .font(.largeTitle)
                    .padding(16)
                ForEach(getAnswers(from: question), id: \.self) { answer in
                    Text(answer)
                        .font(.headline)
                }
            }
        }
    }
    
    private func getAnswers(from question: Question) -> [String] {
        let allAnswers = question.incorrectAnswers + [question.correctAnswer]
        return allAnswers.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(question: QuestionGenerator.shared.randomQuestion())
    }
}

struct BackgroundImageQuestion: View {
    var question: Question
    
    var body: some View {
        Image(systemName: "questionmark.diamond")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(color(from: question.difficulty))
            .opacity(0.5)
            .blur(radius: 3)
            .rotationEffect(.degrees(0))
    }
    
    private func color(from difficulty: Difficulty) -> Color {
        switch difficulty {
        case .easy:
            return .green
        case .medium:
            return .orange
        case .hard:
            return .red
        }
    }
    
}

struct BackgroundImageQuestion_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageQuestion(question: QuestionGenerator.shared.randomQuestion())
    }
}
