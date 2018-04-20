//
//  WeatherCondition.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-25.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation

struct WeatherCondition {
    let cityName: String?
    let weather: String
    let icon: String
    let time: NSDate
    let tempKelvin: Double
    let maxTempKelvin: Double
    let minTempKelvin: Double
    
    var tempFahrenheit: Double {
        get {
            return tempCelsius * 9.0/5.0 + 32.0
        }
    }
    
    var maxTempFahrenheit: Double {
        get {
            return maxTempCelsius * 9.0/5.0 + 32.0
        }
    }
    var minTempFahrenheit: Double {
        get {
            return minTempCelsius * 9.0/5.0 + 32.0
        }
    }
    
    var tempCelsius: Double {
        get {
            return tempKelvin - 273.15
        }
    }
    var maxTempCelsius: Double {
        get {
            return maxTempKelvin - 273.15
        }
    }
    var minTempCelsius: Double {
        get {
            return minTempKelvin - 273.15
        }
    }
    
//    init(cityName: String, weather: String, icon: String, time: NSDate, tempKelvin: Double, maxTempKelvin: Double, minTempKelvin: Double) {
//        self.cityName = cityName
//        self.weather = weather
//        self.icon = icon
//        self.time = time
//        self.tempKelvin = tempKelvin
//        self.maxTempKelvin = maxTempKelvin
//        self.minTempKelvin = minTempKelvin
//    }
    
}

