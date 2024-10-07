//
//  UnsafeSendable.swift
//  aesencryptor
//
//  Created by Andrew G on 07.10.2024.
//

struct UnsafeSendable<T>: @unchecked Sendable {
    let value: T
}
