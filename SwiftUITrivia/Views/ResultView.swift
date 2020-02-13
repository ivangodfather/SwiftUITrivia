//
//  ResultView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 13/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    
    var score: Int
    
    var body: some View {
        VStack {
            Text("🎉").font(.largeTitle)
            Text("Your score is...")
                .font(.title)
            Text(score.description)
                .font(.largeTitle)
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(score: 5)
    }
}
