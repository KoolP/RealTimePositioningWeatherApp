//
//  WeatherDatastore.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-25.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherDatastore {
    let APIKey = "a46f63c4899f9a64dc67f7114b104f2b"
    
    //  Sending the request current, parses the JSON response to convert it to struct:
    func retrieveCurrentWeatherAtLat(lat: CLLocationDegrees, lon: CLLocationDegrees,
                                     block: @escaping (_ weatherCondition: WeatherCondition) -> Void) {
        let url = "http://api.openweathermap.org/data/2.5/weather?APPID=\(APIKey)"
        let params = ["lat": lat, "lon": lon]
        
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
            case .success(let json):
                let json = JSON(json)
                block(self.createWeatherConditionFronJson(json: json))
                print("Success: \(json)") //test
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    //  Sending the request, returns an array of WeatherCondition:
    func retrieveHourlyForecastAtLat(lat: CLLocationDegrees,
                                     lon: CLLocationDegrees,
                                     block: @escaping (_ weatherConditions: Array<WeatherCondition>) -> Void) {
        let url = "http://api.openweathermap.org/data/2.5/forecast?APPID=\(APIKey)"
        let params = ["lat":lat, "lon":lon]
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
                switch response.result {
                case .success(let json):
                    let json = JSON(json)
                    let list: Array<JSON> = json["list"].arrayValue
                    
                    let weatherConditions: Array<WeatherCondition> = list.map() {
                        return self.createWeatherConditionFronJson(json: $0)
                    }
                    block(weatherConditions)
                case .failure(let error):
                    print("Error: \(error)")
                }
        }
    }
    
//  Sending the request, function returns an array for the forecast of the day and upcoming days
    func retrieveDailyForecastAtLat(lat: Double,
                                    lon: Double,
                                    dayCnt: Int,
                                    block: @escaping (_ weatherConditions: Array<WeatherCondition>) -> Void) {
        let url = "http://api.openweathermap.org/data/2.5/forecast/daily?APPID=\(APIKey)"
        let params = ["lat":lat, "lon":lon, "cnt":Double(dayCnt+1)]
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default).responseJSON { (response) in
                switch response.result {
                case .success(let json):
                    let json = JSON(json)
                    let list: Array<JSON> = json["list"].arrayValue
                    let weatherConditions: Array<WeatherCondition> = list.map() {
                        return self.createDayForecastFronJson(json: $0)
                    }
                    let count = weatherConditions.count
                    let daysWithoutToday = Array(weatherConditions[1..<count])
                    block(daysWithoutToday)
                case .failure(let error):
                    print("Error: \(error)")
                }
        }
    }
    
}

//function is responsible for the conversion:
private extension WeatherDatastore {
    func createWeatherConditionFronJson(json: JSON) -> WeatherCondition{
        let name = json["name"].string
        let weather = json["weather"][0]["main"].stringValue
        let icon = json["weather"][0]["icon"].stringValue
        let dt = json["dt"].doubleValue
        let time = NSDate(timeIntervalSince1970: dt)
        let tempKelvin = json["main"]["temp"].doubleValue
        let maxTempKelvin = json["main"]["temp_max"].doubleValue
        let minTempKelvin = json["main"]["temp_min"].doubleValue
        
        return WeatherCondition(
            cityName: name,
            weather: weather,
            icon: IconType(rawValue: icon),
            time: time,
            tempKelvin: tempKelvin,
            maxTempKelvin: maxTempKelvin,
            minTempKelvin: minTempKelvin)
    }
    
    //function is responsible for the conversion, this dayforecast is different than the conversion above
    func createDayForecastFronJson(json: JSON) -> WeatherCondition{
        let name = ""
        let weather = json["weather"][0]["main"].stringValue
        let icon = json["weather"][0]["icon"].stringValue
        let dt = json["dt"].doubleValue
        let time = NSDate(timeIntervalSince1970: dt)
        let tempKelvin = json["temp"]["day"].doubleValue
        let maxTempKelvin = json["temp"]["max"].doubleValue
        let minTempKelvin = json["temp"]["min"].doubleValue
        
        return WeatherCondition(
            cityName: name,
            weather: weather,
            icon: IconType(rawValue: icon),
            time: time,
            tempKelvin: tempKelvin,
            maxTempKelvin: maxTempKelvin,
            minTempKelvin: minTempKelvin)
    }
}
