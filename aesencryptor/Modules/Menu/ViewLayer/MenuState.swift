//
//  MenuState.swift
//  aesencryptor
//
//  Created by Andrew G on 15.07.2023.
//

import Foundation

struct MenuState {
    var password: String
    var text: String
    var error: String
    var isAlertPresented: Bool
    
    static let `default` = Self(
        password: .empty,
        text: .empty,
        error: .empty,
        isAlertPresented: false
    )
}
