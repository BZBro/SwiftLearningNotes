//
//  TSLocationManager.swift
//  ShengJianBao
//
//  Created by welsonla on 16/4/1.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import MapKit
typealias LocationBlock = (locality:String?,error:NSError?)->Void
class TSLocationManager: NSObject, CLLocationManagerDelegate {
    static let shareInstance = TSLocationManager()
    
    var locationManager = CLLocationManager()
    var currentLocation:CLLocation?
    var subLocality: String?
    var locality: String?
    var isLocation = false
    var completeBlock:LocationBlock?
    
    private override init() {
        super.init()
        
        self.locationManagerSetup()
    }
    

    
    func locationManagerSetup() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters
            self.locationManager.requestWhenInUseAuthorization()
        }else{
            CLLocationManager.authorizationStatus()
            UIAlertView.init(title: "提示", message: "定位服务未开启", delegate: nil, cancelButtonTitle: "确定").show()
        }
    }
    
    func startLocation(){
        self.locationManager.stopUpdatingLocation()
        self.locationManager.startUpdatingLocation()
    }
    
    func stopLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    // Mark: location manager delegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.isLocation = true
        print("didUpdateLocations")
        let location:CLLocation = locations[locations.count-1]
        
        if location.horizontalAccuracy > 0 {
            let lat = Float(location.coordinate.latitude)
            let lon = Float(location.coordinate.longitude)
            
            print("[TSLocationManager locationManager:didUpdateLocations] lat = \(lat),  lon = \(lon)")
            
            self.currentLocation = location
            
            CLGeocoder().reverseGeocodeLocation(location){
                (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
                
                guard let placemark = placemarks?.first else {
                    return
                }
                
                self.locality = placemark.locality
                
                self.subLocality = placemark.subLocality
                
                print("locality:\(self.locality)---subLocality:\(self.subLocality)")
                if (self.completeBlock != nil){
                    self.completeBlock!(locality: self.locality!,error: nil)
                }
            }
        }
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        let alert = UIAlertView.init(title: "提示", message: "定位服务未开启", delegate: nil, cancelButtonTitle: "确定")
//        alert.tag = 200
//        alert.show()
        
        print("location.error: \(error.description)")
    }

}
