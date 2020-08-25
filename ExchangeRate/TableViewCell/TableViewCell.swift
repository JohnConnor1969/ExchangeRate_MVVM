//
//  TableViewCell.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var resultStringLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var toUpImage: UIImageView!
    @IBOutlet var flagImage: UIImageView!
    
    var viewModel: TableViewCellViewModelProtocol! {
        didSet {
            nameLabel.text = viewModel.code
            countryLabel.text = viewModel.name
            
            let longValue = viewModel.value ?? 0
            let value = String(format: "%.2f", longValue)
            resultStringLabel.text = "\(value) руб. за \(viewModel.nominal ?? 0) \(viewModel.code ?? "")"
            
            guard let imageData = viewModel.imageData else { return }
            flagImage.image = UIImage(data: imageData)

            switch viewModel.toUp ?? false {
            case true:
                toUpImage.tintColor = .green
                toUpImage.image = UIImage(systemName: "arrow.up.circle.fill")
            case false:
                toUpImage.tintColor = .red
                toUpImage.image = UIImage(systemName: "arrow.down.circle.fill")
            }
        }
    }
}
