//
//  ListCell.swift
//  WeatherJun
//
//  Created by Сергей Горбачёв on 21.10.2020.
//  Copyright © 2020 Сергей Горбачёв. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet var nameCityLabel: UILabel!
    @IBOutlet var conditionCityLabel: UILabel!
    @IBOutlet var tempCityLabel: UILabel!
    
    func configure(weather: Weather) {
        
        self.nameCityLabel.text = weather.name
        self.conditionCityLabel.text = weather.conditionString
        self.tempCityLabel.text = weather.temperatureString
    }

}
