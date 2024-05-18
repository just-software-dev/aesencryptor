//
//  View+Extension.swift
//  aesencryptor
//
//  Created by Andrew G on 15.07.2023.
//

import SwiftUI

extension Axis.Set {
    static var all: Axis.Set { .init([.vertical, .horizontal]) }
}

extension View {
    func frame(squareSize: CGFloat, alignment: Alignment = .center) -> some View {
        frame(width: squareSize, height: squareSize, alignment: alignment)
    }
    
    func eraseToAnyView() -> AnyView {
        .init(self)
    }
    
    func expanded(
        axes: Axis.Set = .all,
        alignment: Alignment = .center
    ) -> some View {
        var resultView = eraseToAnyView()
        if axes.contains(.vertical) {
            resultView = resultView
                .frame(maxHeight: .infinity, alignment: alignment)
                .eraseToAnyView()
        }
        if axes.contains(.horizontal) {
            resultView = resultView
                .frame(maxWidth: .infinity, alignment: alignment)
                .eraseToAnyView()
        }
        return resultView
    }
}
