//
//  QuestionView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    
    var question: Question
    var didSelectAnswer: (String) -> ()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                QuestionBackgroundImage()
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: self.question.category.systemName())
                        Text(self.question.category.rawValue)
                        
                    }
                    .font(.title)
                    .foregroundColor(Color.white)
                    .frame(width: geometry.size.width - 32, height: geometry.size.width / 10, alignment: .center)
                        .background(Color.c)

                    .minimumScaleFactor(0.5)
                    .cornerRadius(12)


                                            
                    Text(self.question.title)
                        .font(.title)
                        .foregroundColor(Color.d)
                        .padding(16)
                        .background(Color.b)
                        .cornerRadius(12)
                        .padding(16)
                    
                    ForEach(self.getAnswers(from: self.question), id: \.self) { answer in
                        QuestionAnswerView(question: self.question, answer: answer, geometry: geometry, didSelectAnswer: self.didSelectAnswer)
                    }
                    Spacer()
                    DifficultyView(difficulty: self.question.difficulty).frame(width: 200, height: 100)
                }
            }
        }
    }
    
    private func getAnswers(from question: Question) -> [String] {
        let allAnswers = question.incorrectAnswers + [question.correctAnswer]
        return allAnswers.shuffled()
    }
}

struct QuestionView_Previews: PreviewProvider {
    @State static var question = QuestionLoader.randomQuestion()
    
    static var previews: some View {
        return QuestionView(question: question, didSelectAnswer: {_ in})
    }
}


extension Color {
    static let a = Color(red: 0.38, green: 0.92, blue: 0.91)
    static let b = Color(red: 1.00, green: 0.99, blue: 0.93)
    static let c = Color(red: 0.99, green: 0.62, blue: 0.48)
    static let d = Color(red: 0.96, green: 0.24, blue: 0.42)
    static let e = Color(red: 0.9, green: 0.1, blue: 0.1)
}
