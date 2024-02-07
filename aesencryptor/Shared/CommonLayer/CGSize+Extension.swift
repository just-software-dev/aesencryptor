//
//  CGSize+Extension.swift
//  aesencryptor
//
//  Created by Andrew G on 16.07.2023.
//

import CoreGraphics

extension CGSize {
    init(squareSize: CGFloat) {
        self.init(width: squareSize, height: squareSize)
    }
}
