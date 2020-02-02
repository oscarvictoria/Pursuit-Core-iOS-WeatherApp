//
//  Weather.swift
//  WeatherApp
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct Weather: Codable {

    let timezone: String
    let daily: Day
}

struct Day: Codable {
    let summary: String
    let data: [Climate]
}

struct Climate: Codable {
    let time: Double
    let temperatureHigh: Double
    let temperatureLow: Double
    let icon: String
}
