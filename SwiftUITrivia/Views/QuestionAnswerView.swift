//
//  QuestionAnswerView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 12/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct QuestionAnswerView: View {
    
    @Binding var question: Question
    var answer: String
    var geometry: GeometryProxy
    
    var body: some View {
        
        Button(action: {
            self.question = QuestionLoader.randomQuestion()
        }) {
            Text(self.answer)
                .font(.title)
                .padding(8)
                .frame(width: geometry.size.width - 16)
        }
            .background(Color.d)
            .foregroundColor(Color.white)
            .cornerRadius(12)
            .padding(12)
    }
}

struct QuestionAnswerView_Previews: PreviewProvider {
    
    @State static var question = QuestionLoader.randomQuestion()
    static var previews: some View {
        GeometryReader { geometry in
            VStack {
                QuestionAnswerView(question: $question, answer: "Random answer",  geometry: geometry)
                QuestionAnswerView(question: $question, answer: "Random answer",  geometry: geometry)
                QuestionAnswerView(question: $question, answer: "Random answer",  geometry: geometry)
                
            }
        }
    }
}
