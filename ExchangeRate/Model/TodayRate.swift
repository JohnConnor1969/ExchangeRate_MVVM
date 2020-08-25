//
//  TodayRate.swift
//  TodayRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

struct TodayRate: Decodable {
    let Date: String
    let Valute: [String: CurrentValute]
}


