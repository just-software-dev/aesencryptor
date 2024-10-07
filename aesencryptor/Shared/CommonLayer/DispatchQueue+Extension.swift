//
//  DispatchQueue+Extension.swift
//  aesencryptor
//
//  Created by Andrew G on 07.10.2024.
//

import Foundation

extension DispatchQueue {
    @discardableResult
    static func onMainThreadSyncSafe<T: Sendable>(_ action: @MainActor () -> T) -> T {
        Thread.isMainThread
            ? MainActor.assumeIsolated(action)
            : DispatchQueue.main.sync(execute: action)
    }
}
