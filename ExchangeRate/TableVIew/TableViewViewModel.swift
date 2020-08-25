//
//  TableViewViewModel.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class TableViewViewModel: TableViewViewModelProtocol {
    var currentValutes: [CurrentValute] = []
    
    private var indexPath: IndexPath?
    
    func numberOfrows() -> Int? {
        return currentValutes.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelProtocol? {
        let currenValute = currentValutes[indexPath.row]
        return TableViewCellViewModel(currentValute: currenValute)
    }
    
    func fetchRates(complition: @escaping () -> Void) {
        NetworkManager.shared.getExchangeRate() { currentValutes in
            self.currentValutes = currentValutes
            complition()
        }
    }
    
    
}
