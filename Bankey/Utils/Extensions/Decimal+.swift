//
//  Decimal+.swift
//  Bankey
//
//  Created by Mason Kim on 2023/01/29.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
