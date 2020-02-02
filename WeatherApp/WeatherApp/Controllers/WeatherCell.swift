//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    
    func configure(for weather: Climate) {
        highLabel.text = "High: \(weather.temperatureHigh.description)℉"
        lowLabel.text = "Low: \(weather.temperatureLow.description)℉"
        weatherImage.image = UIImage(named: weather.icon)
        dateLabel.text = weather.time.timeConverter()
        
    }
    
}
