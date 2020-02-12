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
        NavigationView {
            QuestionView(question: $question)
                .navigationBarTitle("Swift UI Trivia")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(question: QuestionLoader.randomQuestion())
    }
}
