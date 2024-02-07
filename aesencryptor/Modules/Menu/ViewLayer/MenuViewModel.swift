//
//  MenuViewModel.swift
//  aesencryptor
//
//  Created by Andrew G on 15.07.2023.
//

import Foundation

@MainActor
final class MenuViewModel: ObservableObject {
    @Published var state: MenuState = .default
    
    private let encryptionService: EncryptionService
    private let router: AnyRouter<RootCoordinatorItem>
    
    nonisolated init(encryptionService: EncryptionService, router: AnyRouter<RootCoordinatorItem>) {
        self.encryptionService = encryptionService
        self.router = router
    }
    
    func encrypt() {
        do {
            let result = try encryptionService.encrypt(text: state.text, password: state.password)
            showResult(text: result)
        } catch {
            processError(error)
        }
    }
    
    func decrypt() {
        do {
            let result = try encryptionService.decrypt(base64: state.text, password: state.password)
            showResult(text: result)
        } catch {
            processError(error)
        }
    }
    
    func openAbout() {
        router.append(.about)
    }
}

private extension MenuViewModel {
    func processError(_ error: Error) {
        state.error = error.localizedDescription
        state.isAlertPresented = true
    }
    
    func showResult(text: String) {
        router.append(.text(text))
    }
}
