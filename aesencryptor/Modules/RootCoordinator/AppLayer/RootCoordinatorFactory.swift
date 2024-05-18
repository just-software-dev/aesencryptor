//
//  RootCoordinatorFactory.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import Swinject
import SwiftUI

struct RootCoordinatorFactory {
    private let parent: Assembler
    private let assemblies = [RootCoordinatorAssembly()]
    
    init(parent: Assembler) {
        self.parent = parent
    }
    
    @MainActor
    func makeView() -> some View {
        let assembler = Assembler(assemblies, parent: parent)
        let viewModel = { assembler.resolver.resolve(RootCoordinatorViewModel.self)! }
        let itemsFactory = { makeItemsFactory(assembler: assembler) }
        
        return RootCoordinatorView(
            viewModel: viewModel,
            itemsFactory: itemsFactory
        )
    }
}

private struct RootCoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RootCoordinatorViewModel.self) { _ in
            RootCoordinatorViewModel()
        }.inObjectScope(.container)
        
        container.register(AnyRouter<RootCoordinatorItem>.self) {
            $0.resolve(RootCoordinatorViewModel.self)!.asAnyRouter()
        }.inObjectScope(.transient)
    }
}

private func makeItemsFactory(assembler: Assembler) -> RootCoordinatorItemsFactory {
    let menuFactory = MenuFactory(parent: assembler)
    let aboutFactory = AboutFactory(parent: assembler)
    
    return .init(
        menu: { menuFactory.makeView().eraseToAnyView() },
        about: { aboutFactory.makeView().eraseToAnyView() },
        text: { TextScreenView(text: $0).eraseToAnyView() },
        web: { WebView(url: $0).eraseToAnyView() }
    )
}
