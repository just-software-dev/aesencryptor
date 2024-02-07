//
//  Task+Extension.swift
//  aesencryptor
//
//  Created by Andrew G on 07.02.2024.
//

import Foundation

public extension Task where Success == Never, Failure == Never {
    static func sleep(interval: TimeInterval) async {
        try? await Task<Never, Never>.sleep(nanoseconds: UInt64(interval * 1_000_000_000))
    }
}
