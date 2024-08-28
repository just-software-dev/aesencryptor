//
//  ToastViewModifier.swift
//  aesencryptor
//
//  Created by Andrew G on 28.08.2024.
//

import SwiftUI

struct ToastViewModifier: ViewModifier {
    @Binding var text: String?
    @StateObject var viewModel: ToastViewModel
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                if let text = viewModel.text {
                    makeToastView(text: text)
                        .padding()
                        .transition(.move(edge: .bottom))
                        .id(text)
                }
            }
        }.onChange(of: text) {
            viewModel.updateText($0)
        }.onReceive(viewModel.$text) {
            text = $0
        }
    }
    
    init(text: Binding<String?>, viewModel: @MainActor @escaping () -> ToastViewModel) {
        _text = text
        _viewModel = .init(wrappedValue: viewModel())
    }
}

private extension ToastViewModifier {
    func makeToastView(text: String) -> some View {
        Text(text)
            .multilineTextAlignment(.center)
            .padding(Sizes.p12)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerSize: .init(squareSize: Sizes.p8))
            )
    }
}

private let animationDuration: TimeInterval = 0.2
