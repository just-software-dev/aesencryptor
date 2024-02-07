//
//  ToastView.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import SwiftUI
import Combine

extension View {
    func toastView(text: Binding<String?>) -> some View {
        modifier(ToastViewModifier(text: text))
    }
}

private struct ToastViewModifier: ViewModifier {
    @State private var task: Task<Void, Never>?
    @State private var counter: Int = .zero
    
    @Binding var text: String?
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                if let text = text {
                    makeToastView(text: text)
                        .padding()
                        .transition(.move(edge: .bottom))
                        .id(text)
                }
            }.animation(.easeInOut(duration: animationDuration), value: text)
        }.onChange(of: text) { value in
            guard value != nil else { return }
            resetTextAfterDelay()
        }
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
    
    func resetTextAfterDelay() {
        counter += 1
        let id = counter
        task?.cancel()
        
        task = Task {
            await Task.sleep(interval: toastDelay)
            guard id == counter else { return }
            text = nil
        }
    }
}

private let animationDuration: TimeInterval = 0.2
private let toastDelay: TimeInterval = 2.5
