//
//  ViewController.swift
//  Numadic
//
//  Created by Vineal Viji Varghese on 17/07/20.
//  Copyright © 2020 Vineal Viji Varghese. All rights reserved.
//

import UIKit
import CoreLocation

class EntryViewController: UIViewController {
    let locationManager = CLLocationManager()
    var speed = CLLocationSpeed()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
    }
    @IBAction func startServicePressed(_ sender: UIButton) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
    @IBAction func stopServicePressed(_ sender: UIButton) {
        locationManager.stopUpdatingLocation()
    }
}

//MARK: - CLLocationManagerDelegate
extension EntryViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("Got Location\nLatitude:\(lat)\nLongitude:\(lon)")
            if let safeLocation = locationManager.location{
                speed = safeLocation.speed
                print("Speed in m/s= \(String(describing: speed))")
                let speedInKmph = speed * 3.6
                print("Speed in km/h= \(String(describing: speedInKmph))")
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error:\(error.localizedDescription)")
    }
    
}
