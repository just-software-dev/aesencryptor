//
//  AboutFactory.swift
//  aesencryptor
//
//  Created by Andrew G on 17.07.2023.
//

import Swinject
import SwiftUI

struct AboutFactory {
    private let parent: Assembler
    private let assemblies = [AboutAssembly()]
    
    init(parent: Assembler) {
        self.parent = parent
    }
    
    func makeView() -> some View {
        let assembler = Assembler(assemblies, parent: parent)
        let viewModel = { assembler.resolver.resolve(AboutViewModel.self)! }
        return AboutView(viewModel: viewModel)
    }
}

private struct AboutAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AboutViewModel.self) {
            AboutViewModel(router: $0.resolve(AnyRouter<RootCoordinatorItem>.self)!)
        }.inObjectScope(.transient)
    }
}
