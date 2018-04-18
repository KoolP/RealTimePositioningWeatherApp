//
//  MainDataManager.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-22.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//
//  This file communicates with the local plist and manipulating the data, a testfile for dummydata

import Foundation

class MainDataManager {
    
    fileprivate var items:[MainCurrentData] = []
    //takes data from a MainData.plist(test) local xml .plist
    func fetch() {
        for data in loadData() {
            print(data)
            items.append(MainCurrentData(dict: data))
        }
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func explore(at index:IndexPath) -> MainCurrentData {
        return items[index.item]
    }
    
    fileprivate func loadData() -> [[String: AnyObject]] {
        guard let path = Bundle.main.path(forResource: "MainData", ofType: "plist"),
            let items = NSArray(contentsOfFile: path) else {
                //or else if any condition is false return array with empty dictonary
                return [[:]]
        }
        //gives back array of dictonary items
        return items as! [[String : AnyObject]]
    }
    
}




