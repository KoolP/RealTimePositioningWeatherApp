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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action(_ sender: Any) {
    }
    

}
