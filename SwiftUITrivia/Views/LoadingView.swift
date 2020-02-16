//
//  LoadingView.swift
//  SwiftUITrivia
//
//  Created by Ivan Ruiz Monjo on 13/02/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import SwiftUI

struct LoadingView: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<LoadingView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
