//
//  RootCoordinatorState.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import Foundation

enum RootCoordinatorItem: Hashable {
    case text(String)
    case about
    case menu
    case web(URL)
}
