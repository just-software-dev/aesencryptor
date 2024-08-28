//
//  EncryptionService.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import RNCryptor
import Foundation

struct EncryptionService {
    func encrypt(text: String, password: String) throws -> String {
        try checkIsNotEmpty(text: text, password: password)
        
        guard let data = text.data(using: .utf8) else {
            throw CustomError(description: Strings.utf8EncodingError)
        }
        
        let encrypted = RNCryptor.encrypt(data: data, withPassword: password)
        return encrypted.base64EncodedString()
    }
    
    func decrypt(base64: String, password: String) throws -> String {
        try checkIsNotEmpty(text: base64, password: password)
        
        guard let data = Data(base64Encoded: base64) else {
            throw CustomError(description: Strings.base64DecodingError)
        }
        
        let originalData = try RNCryptor.decrypt(data: data, withPassword: password)
        guard let originalText = String(data: originalData, encoding: .utf8) else {
            throw CustomError(description: Strings.utf8DecodingError)
        }
        
        return originalText
    }
}

private extension EncryptionService {
    func checkIsNotEmpty(text: String, password: String) throws {
        guard !password.isEmpty else {
            throw CustomError(description: Strings.passwordIsEmpty)
        }
        
        guard !text.isEmpty else {
            throw CustomError(description: Strings.textIsEmpty)
        }
    }
}
