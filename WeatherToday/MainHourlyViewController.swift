//
//  MainCollectionWeekViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-24.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class MainHourlyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var locationDataModel: LocationDataModel?
    
    
    //dummy data from plist
    let manager = MainDataManager()
    
    //dummy data from plist
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return manager.numberOfItems()}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainWeekCollectionViewCell", for: indexPath) as! MainHourlyViewCell
        
        let item = manager.explore(at: indexPath)
        if let temp = item.temp { cell.tempLabel.text = temp}
        if let image = item.image { cell.weatherImage.image = UIImage(named: image)}
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dummy data from plist
        manager.fetch()

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
            
            //Fetch hourly weather data
            weatherDatastore.retrieveHourlyForecastAtLat(lat: location.lat, lon: location.lon) {
                hourlyWeatherConditions in
                
                DispatchQueue.main.async {
                    

                    
                    
                    
                    //print(currentWeatherConditions.tempCelsius.roundToInt())
                    
                }
            }
        }
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
