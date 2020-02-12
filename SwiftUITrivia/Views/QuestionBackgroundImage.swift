//
//  BackgroundImageQuestion.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct QuestionBackgroundImage: View {
    
    var body: some View {
        Image(systemName: "ant")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.c)
            .opacity(0.8)
            .blur(radius: 5)
            .rotationEffect(.degrees(30))
    }
    
}

struct QuestionBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        QuestionBackgroundImage()
    }
}
