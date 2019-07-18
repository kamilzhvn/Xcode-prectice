//
//  ViewController.swift
//  Location Aware
//
//  Created by macbook on 7/1/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var manager = CLLocationManager()
    
    @IBOutlet var latitude: UILabel!
    @IBOutlet var altitude: UILabel!
    @IBOutlet var speed: UILabel!
    @IBOutlet var course: UILabel!
    @IBOutlet var longitude: UILabel!
    
    @IBOutlet var address: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations[0]
        self.latitude.text = String(location.coordinate.latitude)
        self.longitude.text = String(location.coordinate.longitude)
        self.course.text = String(location.course)
        self.speed.text = String(location.speed)
        self.altitude.text = String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if error != nil{
                print(error)
            } else {
                if let placemark = placemarks? [0]{
                    var address = ""
                    if placemark.subThoroughfare != nil{
                        address += placemark.subThoroughfare! + " "
                    }
                    
                    if placemark.thoroughfare != nil{
                        address += placemark.thoroughfare! + "\n"
                    }
                    
                    if placemark.subLocality != nil{
                        address += placemark.subLocality! + "\n"
                    }
                    
                    if placemark.subAdministrativeArea != nil{
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    
                    if placemark.postalCode != nil{
                        address += placemark.postalCode! + "\n"
                    }
                    
                    if placemark.country != nil{
                        address += placemark.country! + "\n"
                    }
                    
                    self.address.text = address
                    
                    
                }
            }
        }
        
    }
}

