//
//  ViewController.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-02-28.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var dateTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateTime.isHidden = true;
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Pushing satelite animates in the date and time
    @IBAction func satelite(_ sender: Any) {
        if dateTime.isHidden == true {
            dateTime.isHidden = false
            dateTime.alpha = 0.0
            UIView.animate(withDuration: 0.8, animations: {
                self.dateTime.alpha = 1.0
            })
            let datum = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            dateformatter.timeStyle = .short
            dateformatter.locale = Locale(identifier: "sv_SE")
            let stringDate: String = dateformatter.string(from: datum)
            self.dateTime.text = stringDate
        }else if dateTime.isHidden == false {
            dateTime.isHidden = true
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

