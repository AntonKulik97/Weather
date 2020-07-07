//
//  DailyWeather.swift
//  WeatherApp
//
//  Created by Anton Kulik on 5/13/20.
//  Copyright © 2020 Anton Kulik. All rights reserved.
//

import Foundation

class DailyWeather: Decodable {
    
    var dt: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: Temperature?
    var wind_speed: Double?
    var wind_deg: Double?
    var weather: [Weather]?
    var clouds: Double?
    var rain: Double?
    var uvi: Double?
}
