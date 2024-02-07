//
//  AboutViewModel.swift
//  aesencryptor
//
//  Created by Andrew G on 17.07.2023.
//

import Foundation

@MainActor
final class AboutViewModel: ObservableObject {
    @Published var state: AboutState = .default
    
    private let router: AnyRouter<RootCoordinatorItem>
    
    nonisolated init(router: AnyRouter<RootCoordinatorItem>) {
        self.router = router
        Task { @MainActor in setup() }
    }
    
    func openEncryptionCorePage() {
        guard let url = URL(string: Strings.RNCryptorLink) else { return }
        router.append(.web(url))
    }
    
    func openAppGitHub() {
        guard let url = URL(string: Strings.AESEncryptorLink) else { return }
        router.append(.web(url))
    }
}

private extension AboutViewModel {
    var appVersion: String? {
        guard
            let infoDictionary = Bundle.main.infoDictionary,
            let version = infoDictionary["CFBundleShortVersionString"] as? String,
            let build = infoDictionary["CFBundleVersion"] as? String
        else { return nil }
        
        return "\(version) (\(build))"
    }
    
    func setup() {
        state.appVersion = appVersion ?? .empty
    }
}
