//
//  Strings.swift
//  aesencryptor
//
//  Created by Andrew G on 14.07.2023.
//

import Foundation

enum Strings {
    static let passwordPlaceholder = NSLocalizedString("PasswordPlaceholder", comment: .empty)
    static let inputPlaceholder = NSLocalizedString("InputPlaceholder", comment: .empty)
    static let about = NSLocalizedString("About", comment: .empty)
    static let encrypt = NSLocalizedString("Encrypt", comment: .empty)
    static let decrypt = NSLocalizedString("Decrypt", comment: .empty)
    static let menu = NSLocalizedString("Menu", comment: .empty)
    static let text = NSLocalizedString("Text", comment: .empty)
    static let copy = NSLocalizedString("Copy", comment: .empty)
    static let copied = NSLocalizedString("Copied", comment: .empty)
    static let encryptionAlgorithmTitle = NSLocalizedString("EncryptionAlgorithmTitle", comment: .empty)
    static let utf8EncodingError = NSLocalizedString("Utf8EncodingError", comment: .empty)
    static let utf8DecodingError = NSLocalizedString("Utf8DecodingError", comment: .empty)
    static let base64DecodingError = NSLocalizedString("Base64DecodingError", comment: .empty)
    static let cancel = NSLocalizedString("Cancel", comment: .empty)
    static let aesName = NSLocalizedString("AesName", comment: .empty)
    static let cbcMode = NSLocalizedString("CbcMode", comment: .empty)
    static let passwordStretching = NSLocalizedString("PasswordStretching", comment: .empty)
    static let passwordSalting = NSLocalizedString("PasswordSalting", comment: .empty)
    static let randomIV = NSLocalizedString("RandomIV", comment: .empty)
    static let encryptThenHash = NSLocalizedString("EncryptThenHash", comment: .empty)
    static let encryptionCore = NSLocalizedString("EncryptionCore", comment: .empty)
    static let RNCryptorGitHub = NSLocalizedString("RNCryptorGitHub", comment: .empty)
    static let AESEncryptorGitHub = NSLocalizedString("AESEncryptorGitHub", comment: .empty)
    static let RNCryptorLink = NSLocalizedString("RNCryptorLink", comment: .empty)
    static let AESEncryptorLink = NSLocalizedString("AESEncryptorLink", comment: .empty)
    static let passwordIsEmpty = NSLocalizedString("PasswordIsEmpty", comment: .empty)
    static let textIsEmpty = NSLocalizedString("TextIsEmpty", comment: .empty)
    
    static func version(_ value: String) -> String {
        .localizedStringWithFormat(
            NSLocalizedString("Version", comment: .empty),
            value
        )
    }
}

extension String {
    static let empty = ""
}
