//
//  View+ToastView.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import SwiftUI
import Combine

@MainActor 
extension View {
    func toastView(text: Binding<String?>) -> some View {
        modifier(ToastViewModifier(
            text: text,
            viewModel: { .init() }
        ))
    }
}
