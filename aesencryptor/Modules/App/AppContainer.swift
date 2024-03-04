//
//  AppContainer.swift
//  aesencryptor
//
//  Created by Andrew G on 07.02.2024.
//

import Swinject

struct AppContainer {
    let assembler = Assembler([AppAssembly()])
}

struct AppAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(EncryptionService.self) { _ in
            EncryptionService()
        }.inObjectScope(.transient)
    }
}
