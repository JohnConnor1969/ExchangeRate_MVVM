//
//  TableViewCellViewModelProtocol.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol TableViewCellViewModelProtocol: class {
    var code: String? { get }
    var name: String? { get }
    var value: Double? { get }
    var nominal: Int? { get }
    var toUp: Bool? { get }
    var imageData: Data? { get }
}
