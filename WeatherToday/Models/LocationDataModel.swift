//
//  LocationDataModel.swift
//  WeatherToday
//
//  Created by Patrik Rikama Hinnenberg on 2018-03-25.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let lat: Double
    let lon: Double
}

class LocationDataModel: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    let myDebugString = "LocationDataModel active"
    
    typealias LocationClosure = (Location) -> Void
    private let onLocationFound: LocationClosure
    
    init(closure: @escaping LocationClosure){
        onLocationFound = closure
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        startUpdating()
    }
    
    func startUpdating() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //locationManager.stopUpdatingLocation()
        print("Something went wrong with the location manager: \(error)")
//        DispatchQueue.main.async {
//            self.onLocationFound(Location(lat: 37.3175, lon: 122.0419))
//        }
    }
    
    //Keeps track on if user updates location, uses location array
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray = locations as NSArray
        let locationObj = locationArray.lastObject as! CLLocation
        let coord = locationObj.coordinate
        
        DispatchQueue.main.async {
            self.onLocationFound(Location(lat: coord.latitude, lon: coord.longitude))
        }
        
        //Print coordinates
        print("coord = \(coord)")
        //We can get all kind of info: locationObj.altitude, locationObj.speed
        print(locationObj.altitude)
        
        //stopUpdating()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            NSLog("Denied access: Restricted Access to location")
        case .denied:
            NSLog("Denied access: User denied access to location")
        case .notDetermined:
            NSLog("Denied access: Status not determined")
        default:
            NSLog("Allowed to location Access")
            startUpdating()
        }
    }
    

}
