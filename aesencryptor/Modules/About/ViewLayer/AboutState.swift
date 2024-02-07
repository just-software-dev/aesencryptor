//
//  AboutState.swift
//  aesencryptor
//
//  Created by Andrew G on 17.07.2023.
//

import Foundation

struct AboutState {
    let settings: [String]
    var appVersion: String
    
    static let `default` = Self(
        settings: [
            Strings.aesName,
            Strings.cbcMode,
            Strings.passwordStretching,
            Strings.passwordSalting,
            Strings.randomIV,
            Strings.encryptThenHash,
        ],
        appVersion: .empty
    )
}
