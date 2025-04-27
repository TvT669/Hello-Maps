//
//  LocationManager.swift
//  Hello-Maps
//
//  Created by Mohammad Azam on 8/2/23.
//

import Foundation
import MapKit

class LocationManager {
    static let shared = LocationManager()
    let manager: CLLocationManager = CLLocationManager()
    
     init() {
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        }
    }
 
}
