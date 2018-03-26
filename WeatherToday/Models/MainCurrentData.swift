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
    var name:String?
    var image:String?
    //var weatherIcon:String?
}

//custom initialiser for dictonary data, takes dictonary object as parameter
extension MainCurrentData {
    init(dict:[String:AnyObject]) {
        self.name = dict["name"] as? String
        self.image = dict["image"] as? String
    }
}




//Dictonary data: ["name": "All", "image": "all.png"]




