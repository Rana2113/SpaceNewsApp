//
//  String.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 16/07/2025.
//

import Foundation
extension String {
    func removesuffix () -> String {
        if self.hasSuffix("[…]") {
            return String (self.dropLast(4)).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return self
    }
}
