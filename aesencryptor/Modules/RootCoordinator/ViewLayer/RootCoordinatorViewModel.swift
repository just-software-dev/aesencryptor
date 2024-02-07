//
//  RootCoordinatorViewModel.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import SwiftUI

@MainActor
final class RootCoordinatorViewModel: ObservableObject, Router {
    typealias Item = RootCoordinatorItem
    
    @Published var state = NavigationPath()
    
    func append(_ item: RootCoordinatorItem) {
        state.append(item)
    }
    
    func removeLast() {
        state.removeLast()
    }
    
    nonisolated init() {}
}
