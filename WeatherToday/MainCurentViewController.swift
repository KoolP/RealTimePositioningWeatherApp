//
//  MainCurentViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-24.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class MainCurentViewController: UIViewController {

    @IBOutlet weak var mainCurrentCity: UILabel!
    @IBOutlet weak var mainCurrentTemp: UILabel!
    @IBOutlet weak var mainCurrentWeatherIcon: UIImageView!
    
    private var locationDataModel: LocationDataModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationDataModel = LocationDataModel() { [weak self] location in

            //Current weather forecasts for current lat lon
            let weatherDatastore = WeatherDatastore()
            weatherDatastore.retrieveCurrentWeatherAtLat(lat: location.lat, lon: location.lon) {
                currentWeatherConditions in
                
//                Can't get the cityName from WeatherCondition
                var currentWeatherConditions: WeatherCondition?
                self?.mainCurrentCity.text = currentWeatherConditions?.cityName ?? ""
                
                
            }
            
            //This request works but will include in weekly/hourlyColectionViewController
//            weatherDatastore.retrieveHourlyForecastAtLat(lat: location.lat, lon: location.lon) {
//                hourlyWeatherConditions in
//
//            }
            
            //APIKey may be prohibited for daily forecast: Please see error status http://openweathermap.org/faq#error401
//            weatherDatastore.retrieveDailyForecastAtLat(lat: location.lat, lon: location.lon, dayCnt: 7) {
//                hourlyWeatherConditions in
//
//            }
        
        }
    }

//    extension MainCurentViewController {
//
    func renderData(weathercondition: WeatherCondition) {
//        mainCurrentWeatherIcon.image = IconType

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
