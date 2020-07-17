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
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    @IBAction func startServicePressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}

//MARK: - CLLocationManagerDelagate
extension EntryViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            print("Got Location\nLatitude:\(lat)\nLongitude:\(lon)")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error:\(error)")
    }
}
