//
//  MainLocationsTableViewCell.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-24.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class MainSearchControllerCell: UITableViewCell {

    @IBOutlet weak var locationCityName: UILabel!
    @IBOutlet weak var locationWeatherIcon: UIImageView!
    @IBOutlet weak var locationTemp: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
