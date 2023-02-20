//
//  Array+.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/29.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
