//
//  TableViewCellViewModel.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelProtocol {
    
    private var currentValute: CurrentValute
    
    init(currentValute: CurrentValute) {
        self.currentValute = currentValute
    }
    
    var code: String? {
        return currentValute.CharCode
    }
    
    var name: String? {
        return currentValute.Name
    }
    
    var value: Double? {
        return currentValute.Value
    }
    
    var nominal: Int? {
        return currentValute.Nominal
    }
    
    var toUp: Bool? {
        return currentValute.toUp
    }
    
    var imageData: Data? {
        let moneyCode = currentValute.CharCode
        let countryCode = moneyCode.dropLast()
        let adress = "https://www.countryflags.io/\(countryCode)/flat/64.png"
        return ImageManager.shared.getImageData(from: adress)
    }
}
