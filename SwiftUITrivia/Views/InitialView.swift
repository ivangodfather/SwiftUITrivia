//
//  InitialView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 13/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct InitialView: View {
    let game: Game
    @State var aboutIsPresented = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundImage()
                VStack {
                    Spacer()
                    Button(action: {
                        self.game.startGame()
                    }) {
                        Text("Start game!")
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding(.bottom)
                    NavigationLink(destination: ConfigurationView()) {
                        Text("Configure").bold()
                    }.padding()
                    Button(action: {
                        self.aboutIsPresented.toggle()
                    }) {
                        Text("About").bold()
                    }.alert(isPresented: self.$aboutIsPresented) {
                        Alert(title: Text("SwiftUI Trivia"),
                              message: Text("By Iván Ruiz 2020"))
                    }
                    Spacer()
                }
            }.navigationBarTitle("SwiftUI Trivia")
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView(game: Game())
    }
}
