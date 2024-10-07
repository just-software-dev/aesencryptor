//
//  Swinject+Extension.swift
//  aesencryptor
//
//  Created by Andrew G on 07.10.2024.
//

import Swinject
import Foundation

@MainActor
protocol MainThreadAssembly: Assembly, Sendable {
    func assembleOnMainThread(container: Container)
}

extension MainThreadAssembly {
    nonisolated func assemble(container: Container) {
        MainActor.assertIsolated()
        let sendable = UnsafeSendable(value: container)
        
        DispatchQueue.onMainThreadSyncSafe {
            assembleOnMainThread(container: sendable.value)
        }
    }
}
