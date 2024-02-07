//
//  SharedAssembly.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import Swinject

struct SharedAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(EncryptionService.self) { _ in
            EncryptionService()
        }.inObjectScope(.transient)
    }
}
