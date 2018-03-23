//
//  MainCurrentData.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-22.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.

//  This file represents our data with city, temp and weatherIcon

import Foundation

//struct makes init by default. Cant make them inital we make them optional
struct MainCurrentData {
    var city:String?
    var temp:String?
    //var weatherIcon:String?
}


extension MainCurrentData {
    init(dict:[String:AnyObject]) {
        self.city  = dict["city"] as? String
        self.temp = dict["temp"] as? String
    }
}




//Dictonary data: ["name": "All", "image": "all.png"]




