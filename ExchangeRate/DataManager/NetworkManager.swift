//
//  DataManager.swift
//  ExchangeRate
//
//  Created by Valeriy Pokatilo on 25.08.2020.
//  Copyright © 2020 Valeriy Pokatilo. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getExchangeRate(complition: @escaping (_ currentValutes: [CurrentValute]) -> ()) {
        var valutes: [CurrentValute] = []
        
        let jsonUrlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            guard let data = data else { return }
            
            do {
                let today = try JSONDecoder().decode(TodayRate.self, from: data)
                                            
                for (_, valute) in today.Valute {
                    if valute.CharCode != "XDR" {
                        valutes.append(valute)
                    }
                }
                complition(valutes)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
