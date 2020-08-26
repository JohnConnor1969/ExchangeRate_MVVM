//
//  TableViewViewModelProtocol.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

protocol TableViewViewModelProtocol {
    
    var currentValutes: [CurrentValute] { get }
    
    func numberOfrows() -> Int?
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol?
    
    func fetchRates(complition: @escaping() -> Void)
}
