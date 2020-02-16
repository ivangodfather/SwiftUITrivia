//
//  ConfigurationView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 14/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct ConfigurationView: View {
    
    @EnvironmentObject var gameSettings: GameSettings
    var allowedNumQuestions = [10, 20, 30]
    var body: some View {
        Form {
            Toggle(isOn: $gameSettings.enableSound) {
                Text("Enable sound")
            }
            Picker(selection: $gameSettings.numberOfQuestions,
                   label: Text("Number of questions")) {
                ForEach(allowedNumQuestions, id: \.self) { num in
                    Text(num.description)
                }
            }
        }.navigationBarTitle("Configuration")
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
            .environmentObject(GameSettings())
    }
}

class GameSettings: ObservableObject {
    @Published var enableSound: Bool = false
    @Published var numberOfQuestions = 10
}
