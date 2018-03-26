//
//  MainCollectionWeekViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-24.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class MainCollectionWeekViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var weatherImageArray = [UIImage(named: "01d"), UIImage(named: "02d"), UIImage(named: "03d"), UIImage(named: "04d"), UIImage(named: "01d"), UIImage(named: "01d"), UIImage(named: "01d"), UIImage(named: "01d")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return weatherImageArray.count}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainWeekCollectionViewCell", for: indexPath) as! MainWeekCollectionViewCell
        
        cell.weatherImage.image = weatherImageArray[indexPath.row]
        return cell
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//                let manager = MainDataManager()
//                manager.fetch()

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
