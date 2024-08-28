//
//  ToastViewModel.swift
//  aesencryptor
//
//  Created by Andrew G on 28.08.2024.
//

import SwiftUI

@MainActor
final class ToastViewModel: ObservableObject {
    @Published private(set) var text: String?
    
    private var task: Task<Void, Never>?
    private var counter: Int = .zero
    
    func updateText(_ newValue: String?) {
        guard text != newValue else { return }
        
        counter += 1
        task?.cancel()
        let id = counter
        withAnimation { text = newValue }
        guard newValue != nil else { return }
        
        task = Task {
            await Task.sleep(interval: toastDelay)
            guard id == counter else { return }
            withAnimation { text = nil }
        }
    }
}

private let toastDelay: TimeInterval = 2.5
