//
//  MainCollectionWeekViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-24.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class MainHourlyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //v2 from plist
    let manager = MainDataManager()
    
    //v1 fake array
//    var weatherImageArray = [UIImage(named: "01d"), UIImage(named: "02d"), UIImage(named: "03d"), UIImage(named: "04d"), UIImage(named: "01d"), UIImage(named: "01d"), UIImage(named: "01d"), UIImage(named: "01d")]
    
    //v2 data from plist
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return manager.numberOfItems()}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainWeekCollectionViewCell", for: indexPath) as! MainHourlyViewCell

        //v1 fake array
//        cell.weatherImage.image = weatherImageArray[indexPath.row]
        
        let item = manager.explore(at: indexPath)
        if let temp = item.temp { cell.tempLabel.text = temp}
        if let image = item.image { cell.weatherImage.image = UIImage(named: image)}
        
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //v2 from plist
        manager.fetch()

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
