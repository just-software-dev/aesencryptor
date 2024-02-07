//
//  RootCoordinatorView.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var viewModel: RootCoordinatorViewModel
    @StateObject private var itemsFactory: RootCoordinatorItemsFactory
    
    var body: some View {
        NavigationStack(path: $viewModel.state) {
            makeItemView(item: .menu).navigationDestination(
                for: RootCoordinatorItem.self,
                destination: makeItemView
            )
        }.navigationViewStyle(.stack)
    }
    
    init(
        viewModel: @escaping () -> RootCoordinatorViewModel,
        itemsFactory: @escaping () -> RootCoordinatorItemsFactory
    ) {
        _viewModel = .init(wrappedValue: viewModel())
        _itemsFactory = .init(wrappedValue: itemsFactory())
    }
}

private extension RootCoordinatorView {
    @ViewBuilder
    func makeItemView(item: RootCoordinatorItem) -> some View {
        switch item {
        case let .text(text):
            itemsFactory.text(text)
        case .about:
            itemsFactory.about()
        case .menu:
            itemsFactory.menu()
        case let .web(url):
            itemsFactory.web(url)
        }
    }
}
