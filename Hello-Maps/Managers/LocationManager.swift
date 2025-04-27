//
//  LocationManager.swift
//  Hello-Maps
//
//  Created by Mohammad Azam on 8/2/23.
//

import Foundation
import MapKit
import Observation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    let manager: CLLocationManager = CLLocationManager()
    var region: MKCoordinateRegion = MKCoordinateRegion()
    
    override init() {
        super.init()
        self.manager.delegate = self//让当前类成为位置管理器的代理，从而接收并处理定位相关事件。这是 iOS 定位功能的核心机制
        manager.desiredAccuracy = kCLLocationAccuracyBest
        /*if self.manager.authorizationStatus == .notDetermined {
            self.manager.requestWhenInUseAuthorization()
        } else if self.manager.authorizationStatus == .authorizedAlways || self.manager.authorizationStatus == .authorizedWhenInUse {
            self.manager.requestLocation()
        }
        self.manager.requestLocation()*/
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways:
            manager.requestLocation()
        case .denied:
            print("denied")
        case .restricted:
            print("restricted")
        @unknown default:
            break
        }
    }
 
    //​当用户位置更新时，将地图视图的中心点和缩放级别设置为最新位置
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    //.map 是 Swift 的可选值处理方法：如果 locations.last 存在（非 nil），则执行闭包中的代码；如果为 nil，则忽略。
    
    //捕获定位失败的错误
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

