//
//  MenuView.swift
//  aesencryptor
//
//  Created by Andrew G on 14.07.2023.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel: MenuViewModel
    
    var body: some View {
        List {
            Section { keyTextField }
            Section { inputTextField }
            Section { buttonsStack }.buttonStyle(.borderless)
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle(.init(Strings.menu))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { Button(Strings.about) { viewModel.openAbout() } }
        .alert(viewModel.state.error, isPresented: $viewModel.state.isAlertPresented) { cancelButton }
    }
    
    init(viewModel: @escaping () -> MenuViewModel) {
        _viewModel = .init(wrappedValue: viewModel())
    }
}

private extension MenuView {
    var keyTextField: some View {
        SecureField(Strings.passwordPlaceholder, text: $viewModel.state.password)
    }
    
    var inputTextField: some View {
        TextField(Strings.inputPlaceholder, text: $viewModel.state.text, axis: .vertical)
    }
    
    var buttonsStack: some View {
        HStack {
            Button(action: { viewModel.encrypt() }) {
                Text(Strings.encrypt)
                    .expanded(axes: .horizontal)
            }
            Divider()
            Button(action: { viewModel.decrypt() }) {
                Text(Strings.decrypt)
                    .expanded(axes: .horizontal)
                    .foregroundColor(.red)
            }
        }
    }
    
    var cancelButton: some View {
        Button(Strings.cancel) {
            viewModel.state.isAlertPresented = false
        }
    }
}
