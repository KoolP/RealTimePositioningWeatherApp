//
//  MainCurentViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-24.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit
import Foundation

class MainCurentViewController: UIViewController {

    @IBOutlet weak var mainCurrentCity: UILabel!
    @IBOutlet weak var mainCurrentTemp: UILabel!
    @IBOutlet weak var mainCurrentWeatherIcon: UIImageView!    
    @IBOutlet weak var canYouBike: UIImageView!
    
    private var locationDataModel: LocationDataModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationDataModel = LocationDataModel() { [weak self] location in

            //Current weather forecasts for current lat lon
            let weatherDatastore = WeatherDatastore()
            weatherDatastore.retrieveCurrentWeatherAtLat(lat: location.lat, lon: location.lon) {
                currentWeatherConditions in
                
                DispatchQueue.main.async {
                        self?.mainCurrentCity.text = currentWeatherConditions.cityName ?? ""
                        self?.mainCurrentTemp.text = "\(currentWeatherConditions.tempCelsius.roundToInt())°"
                        self?.mainCurrentWeatherIcon.image = UIImage (named: currentWeatherConditions.icon)
                    
                    print(currentWeatherConditions.tempCelsius.roundToInt())
                    
                    //What clothes to wear today changed to:
                    //Can you bike to school temp checker info sign
                    var tempYouCanBike = currentWeatherConditions.tempCelsius.roundToInt()
                    if (Int(tempYouCanBike) > 8) {
                        self?.canYouBike.image = UIImage (named: "bikeYes")
                    } else if (Int(tempYouCanBike) < 8) {
                        self?.canYouBike.image = UIImage (named: "bikeNo")
                    }
                    
                }

            }
            

//            //Request not working for daily forecast
//            //APIKey may be prohibited for daily forecast: Please see error status http://openweathermap.org/faq#error401
//            weatherDatastore.retrieveDailyForecastAtLat(lat: location.lat, lon: location.lon, dayCnt: 7) {
//                hourlyWeatherConditions in
//
//            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//  extension MainCurentViewController {
//  This metric function not in use
//  Found new solution for metric conversion in request
    func renderData(weathercondition: WeatherCondition) {

        var usesMetric = false
        if let localeSystem = Locale.current.usesMetricSystem as? Bool {
            usesMetric = localeSystem
        }
            if usesMetric {
                mainCurrentTemp.text = "\(weathercondition.tempCelsius.rounded())°"
            } else {
                mainCurrentTemp.text = "\(weathercondition.tempFahrenheit.rounded())°"
            }
            mainCurrentCity.text = weathercondition.cityName ?? ""
        }

    
}

//Changing temp: Double to whole number Int and assigning to UILabel
extension Double {
    func roundToInt() -> Int{
        return Int(Darwin.round(self))
    }
}
