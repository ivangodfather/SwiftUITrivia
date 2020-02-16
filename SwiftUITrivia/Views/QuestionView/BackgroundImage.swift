//
//  BackgroundImageQuestion.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct BackgroundImage: View {
    
    var body: some View {
        Image(systemName: "ant")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.gray)
            .opacity(0.3)
            .blur(radius: 12)
            .rotationEffect(.degrees(30))
    }
    
}

struct QuestionBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImage()
    }
}
