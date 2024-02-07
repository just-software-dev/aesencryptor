//
//  CustomError.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import Foundation

struct CustomError: LocalizedError {
    let errorDescription: String?
    
    init(description: String) {
        errorDescription = description
    }
}
