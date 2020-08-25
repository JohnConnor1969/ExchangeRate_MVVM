//
//  CurrentValute.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 26.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

struct CurrentValute: Decodable {
    let CharCode: String
    let Nominal: Int
    let Name: String
    let Value: Double
    let Previous: Double
    var toUp: Bool {
        return Value > Previous ? true : false
    }
}
