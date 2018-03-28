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

            // calls to get the current weather
            let weatherDatastore = WeatherDatastore()
            weatherDatastore.retrieveCurrentWeatherAtLat(lat: location.lat, lon: location.lon) {
                currentWeatherConditions in
                
                
                //fel, hur söka datan till denna viewcontroller?
//                self?.renderCurrent(currentWeatherConditions: currentWeatherConditions)
                return
            }
        }
    }
    
    
    
    
//    //den är fel
//    func renderCurrent(currentWeatherConditions: WeatherCondition){
//        MainCurentViewController.render(currentWeatherConditions)
//    }
//
//    //den är fel
//    // MARK: - Render
//    extension CurrentWeatherView{
//        func render(weatherCondition: WeatherCondition){
//            self.mainCurrentWeatherIcon.image = iconStringFromIcon(weatherCondition.icon!)
//            self.mainCurrentTemp.text = weatherCondition.weather
//
//            var usesMetric = false
//            if let localeSystem = NSLocale.currentLocale().objectForKey(NSLocaleUsesMetricSystem) as? Bool {
//                usesMetric = localeSystem
//            }
//
//            if usesMetric {
//                self.mainCurrentTemp.text = "\(weatherCondition.tempCelsius.roundToInt())°"
//            } else {
//                self.mainCurrentTemp.text = "\(weatherCondition.tempFahrenheit.roundToInt())°"
//            }
//
//            self.mainCurrentCity.text = weatherCondition.cityName ?? ""
//        }
//    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
