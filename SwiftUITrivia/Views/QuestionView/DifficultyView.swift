//
//  DifficultyView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 11/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct DifficultyView {

    var difficulty: Difficulty
    
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
    }

    private func getArrowAttributes(from difficulty: Difficulty) -> (color: Color, degrees: Double) {
        switch difficulty {
        case .easy: return (.green, -70)
        case .medium: return (.yellow, 0)
        case .hard: return (.red, 70)
        }
    }
    
    private func getRadius(geometry: GeometryProxy) -> CGFloat {
        return min(geometry.size.width / 2, geometry.size.height)
    }
}


extension DifficultyView: View {

    var body: some View {

        GeometryReader { geometry in
            ZStack {
                Path { path in
                    path.addArc(center: .init(x: geometry.size.width * 0.5, y: geometry.size.height),
                                radius: self.getRadius(geometry: geometry),
                                startAngle: .degrees(0),
                                endAngle: .degrees(180),
                                clockwise:  true)

                }.fill( LinearGradient(gradient: .init(colors: Difficulty.allCases.map(self.getArrowAttributes).map { $0.color }),
                                       startPoint: .init(x: 0, y: 0),
                                       endPoint: .init(x: 1, y: 0.0)

                ))
                
                Path { path in
                    path.addArc(center: .init(x: geometry.size.width * 0.5, y: geometry.size.height),
                                radius: self.getRadius(geometry: geometry) / 2,
                                startAngle: .degrees(0),
                                endAngle: .degrees(180),
                                clockwise:  true)
                }.fill(Color.white)
                Image(systemName: "location.north")
                    .resizable()
                    .frame(width: min(geometry.size.width, geometry.size.height) / 4, height: min(geometry.size.width, geometry.size.height) / 3)
                    .rotationEffect(.degrees(self.getArrowAttributes(from: self.difficulty).degrees))
                    .foregroundColor(self.getArrowAttributes(from: self.difficulty).color)
                    .offset(x: 0, y: geometry.size.height / 3)
            }
        }
    }

}

struct FirstVisitAward_Previews: PreviewProvider {

    static let height: CGFloat = 100
    static let width: CGFloat = 130

    static var previews: some View {
        VStack {
            DifficultyView(difficulty: .hard)
                .frame(width: width, height: height, alignment: .center)
            DifficultyView(difficulty: .medium)
                .frame(width: width, height: height, alignment: .center)
            DifficultyView(difficulty: .easy)
                .frame(width: height, height: width, alignment: .center)
        }
    }
}
