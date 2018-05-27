//
//  WeatherCondition2.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-04-20.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation

struct WeatherCondition2: Codable {

    let main: Main
    let name: String
    let wind: [String: Float]
    let coord: Coord
    let weather: [Weather]

    //    var temp: Double {
    //        return main!["temp"]! - 273.15
    //    }
    //    let coor: [String : Double]
    //    let weather
}

struct Main : Codable {
    let temp: Double?
}

struct Coord: Codable {
    let lon: Double?
    let lat: Double?
}

struct Weather: Codable {
    let icon: String
    let main: String
}




//struct WeatherCondition2: Codable {
//
//    let cityName: String
//    let icon: String
//    let tempKelvin: Double
//
//    var tempCelsius: Double {
//        get {
//            return tempKelvin - 273.15
//        }
//    }
//
//}
