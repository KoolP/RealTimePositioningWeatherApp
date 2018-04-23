//
//  ForecastTableViewCell.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-11.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

//TEST this controller not in use

import UIKit

class CalendarTableViewCell: UITableViewCell {

    @IBOutlet weak var dayAndDate: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
