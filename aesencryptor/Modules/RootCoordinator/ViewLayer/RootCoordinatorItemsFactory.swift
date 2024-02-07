//
//  RootCoordinatorItemsFactory.swift
//  aesencryptor
//
//  Created by Andrew G on 17.07.2023.
//

import SwiftUI

@MainActor
final class RootCoordinatorItemsFactory: ObservableObject {
    let menu: () -> AnyView
    let about: () -> AnyView
    let text: (String) -> AnyView
    let web: (URL) -> AnyView
    
    nonisolated init(
        menu: @escaping () -> AnyView,
        about: @escaping () -> AnyView,
        text: @escaping (String) -> AnyView,
        web: @escaping (URL) -> AnyView
    ) {
        self.menu = menu
        self.about = about
        self.text = text
        self.web = web
    }
}
