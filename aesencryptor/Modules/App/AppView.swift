//
//  AppView.swift
//  aesencryptor
//
//  Created by Andrew G on 14.07.2023.
//

import SwiftUI

@main
struct AppView: App {
    @State private var rootCoordinatorFactory = RootCoordinatorFactory(
        parent: AppContainer().assembler
    )
    
    var body: some Scene {
        WindowGroup {
            rootCoordinatorFactory.makeView()
        }
    }
}
