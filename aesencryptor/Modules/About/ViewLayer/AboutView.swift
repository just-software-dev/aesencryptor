//
//  AboutView.swift
//  aesencryptor
//
//  Created by Andrew G on 17.07.2023.
//

import SwiftUI

struct AboutView: View {
    @StateObject private var viewModel: AboutViewModel
    
    var body: some View {
        List {
            Section(Strings.encryptionAlgorithmTitle) {
                ForEach(viewModel.state.settings, id: \.self) {
                    Text($0)
                }
            }
            
            Section(Strings.encryptionCore) {
                NavigationButton(action: { viewModel.openEncryptionCorePage() }) {
                    Text(Strings.RNCryptorGitHub)
                }
            }
            
            Section {
                NavigationButton(action: { viewModel.openAppGitHub() }) {
                    Text(Strings.AESEncryptorGitHub)
                }
            }
            
            Section { Text(Strings.version(viewModel.state.appVersion)) }
        }
        .navigationTitle(Strings.about)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(viewModel: @escaping () -> AboutViewModel) {
        _viewModel = .init(wrappedValue: viewModel())
    }
}
