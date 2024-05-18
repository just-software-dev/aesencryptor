//
//  RootCoordinatorItemsFactory.swift
//  aesencryptor
//
//  Created by Andrew G on 17.07.2023.
//

import SwiftUI

final class RootCoordinatorItemsFactory: ObservableObject {
    let menu: @MainActor () -> AnyView
    let about: @MainActor () -> AnyView
    let text: @MainActor (String) -> AnyView
    let web: @MainActor (URL) -> AnyView
    
    nonisolated init(
        menu: @escaping @MainActor () -> AnyView,
        about: @escaping @MainActor () -> AnyView,
        text: @escaping @MainActor (String) -> AnyView,
        web: @escaping @MainActor (URL) -> AnyView
    ) {
        self.menu = menu
        self.about = about
        self.text = text
        self.web = web
    }
}
