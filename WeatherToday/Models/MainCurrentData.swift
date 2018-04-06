//
//  MainCurrentData.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-22.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.

//  This local test file represents city, temp and weatherIcon
//  Only for training purposes towards a plistfile at the moment

import Foundation

//struct makes init by default. Cant make them inital we make them optional
struct MainCurrentData {
    var temp:String?
    var image:String?
    //var weatherIcon:String?
}

//Creates custom initializer, ability to extend and add more functionalities
extension MainCurrentData {
    init(dict:[String:AnyObject]) {
        self.temp = dict["temp"] as? String
        self.image = dict["image"] as? String
    }
}



//Dictonary data: ["name": "All", "image": "all.png"]




