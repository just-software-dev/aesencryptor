//
//  TextScreenView.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import SwiftUI

struct TextScreenView: View {
    @State private var toastText: String?
    
    let text: String
    
    var body: some View {
        ScrollView {
            Text(text)
                .padding(.horizontal)
                .expanded(axes: .horizontal, alignment: .leading)
        }
        .navigationTitle(.init(Strings.text))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { toolbar }
        .toastView(text: $toastText)
    }
}

private extension TextScreenView {
    var toolbar: some ToolbarContent {
        ToolbarItem {
            Button(Strings.copy, action: copyText)
        }
    }
    
    func copyText() {
        UIPasteboard.general.string = text
        toastText = Strings.copied
    }
}
