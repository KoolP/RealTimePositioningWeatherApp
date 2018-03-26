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
        
//        let manager = MainDataManager()
//        manager.fetch()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func satelite(_ sender: Any) {
        let datum = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .short
        dateformatter.locale = Locale(identifier: "sv_SE")
        let stringDate: String = dateformatter.string(from: datum)
        self.dateTime.text = stringDate
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

