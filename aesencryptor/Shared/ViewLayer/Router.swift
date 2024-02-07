//
//  Router.swift
//  aesencryptor
//
//  Created by Andrew G on 02.08.2023.
//

import Combine

@MainActor
protocol Router {
    associatedtype Item: Hashable
    
    func append(_ item: Item)
    func removeLast()
}

@MainActor
struct AnyRouter<Item: Hashable> {
    private let _append: @MainActor (Item) -> Void
    private let _removeLast: @MainActor () -> Void
    
    nonisolated init<R: Router>(_ router: R) where Item == R.Item {
        _append = router.append
        _removeLast = router.removeLast
    }
}

extension AnyRouter: Router {
    func append(_ item: Item) {
        _append(item)
    }
    
    func removeLast() {
        _removeLast()
    }
}

extension Router {
    nonisolated func asAnyRouter() -> AnyRouter<Item> {
        .init(self)
    }
}
