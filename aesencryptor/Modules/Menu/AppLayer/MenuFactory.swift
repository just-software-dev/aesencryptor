//
//  MenuFactory.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import Swinject
import SwiftUI

struct MenuFactory {
    private let parent: Assembler
    private let assemblies = [MenuAssembly()]
    
    init(parent: Assembler) {
        self.parent = parent
    }
    
    @MainActor
    func makeView() -> some View {
        let assembler = Assembler(assemblies, parent: parent)
        let viewModel = { assembler.resolver.resolve(MenuViewModel.self)! }
        return MenuView(viewModel: viewModel)
    }
}

private struct MenuAssembly: MainThreadAssembly {
    func assembleOnMainThread(container: Container) {
        container.register(MenuViewModel.self) {
            MenuViewModel(
                encryptionService: $0.resolve(EncryptionService.self)!,
                router: $0.resolve(AnyRouter<RootCoordinatorItem>.self)!
            )
        }.inObjectScope(.transient)
    }
}
