//
//  TableViewController.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: TableViewViewModelProtocol! {
        didSet {
            viewModel.fetchRates() {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewModelInit()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfrows() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel

        return cell
    }
    
    // MARK: - Functions
    
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        ViewModelInit()
    }
    
    private func ViewModelInit() {
        viewModel = TableViewViewModel()
    }
}
