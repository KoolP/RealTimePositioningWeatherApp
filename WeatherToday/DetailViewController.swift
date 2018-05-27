//
//  DetailViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-05-26.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var iconen: UIImageView!
    @IBOutlet weak var canUBike: UILabel!
    let temperature = locationCity[rowNr]["temp"]
    
    @IBOutlet weak var button: UIButton!
    var snap : UISnapBehavior!
    var animator : UIDynamicAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(rowNr, "rowNum")
        city.text = locationCity[rowNr]["city"]
        wind.text = locationCity[rowNr]["wind"]
        temp.text = "\(locationCity[rowNr]["temp"] ?? "0")°C"
        iconen.image = UIImage (named: locationCity[rowNr]["icon"]!)
        print(locationCity)
        
        //only downsizes font
        canUBike.adjustsFontSizeToFitWidth = true
        canUBike.baselineAdjustment = .alignCenters
        animator = UIDynamicAnimator(referenceView: self.view)
        var orginalPos = canUBike.center
        canUBike.center = CGPoint(x: self.view.frame.width / 2, y: -canUBike.frame.height)
        snap = UISnapBehavior(item: canUBike, snapTo: orginalPos)
        animator.addBehavior(snap)
        
        bikeMeter()
    }

    func bikeMeter () {
        if (Int(temperature!)! < 1) {
            canUBike.text = " Take the skies or skates."
        } else if (Int(temperature!)! < 5) {
            canUBike.text = " A bit chilly for bike commuting"
        } else if (Int(temperature!)! < 25) {
            canUBike.text = " Great temp for bike commuting"
        } else if (Int(temperature!)! < 30) {
            canUBike.text = " Almost too warm for bike commuting"
        }
    }
    
    

}
