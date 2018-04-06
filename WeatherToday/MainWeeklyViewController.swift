//
//  MainLocationsViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-24.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class MainWeeklyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let locations = ["Gothenburg", "Helsinki", "Stockholm", "Miami", "Amsterdam"]
    
    var weatherImageArray = [UIImage(named: "01d"), UIImage(named: "02d"), UIImage(named: "03d"), UIImage(named: "04d"), UIImage(named: "01d")]
    
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(locations.count)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:MainWeeklyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "mainLocationsTableViewCell") as! MainWeeklyTableViewCell
        
            cell.locationCityName?.text = self.locations[indexPath.row]
        
            cell.locationWeatherIcon.image = weatherImageArray[indexPath.row]
        
        return(cell)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
