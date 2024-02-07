//
//  AppContainer.swift
//  aesencryptor
//
//  Created by Andrew G on 07.02.2024.
//

import Swinject

struct AppContainer {
    let assembler = Assembler([SharedAssembly()])
}
