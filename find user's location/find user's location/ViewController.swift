//
//  ViewController.swift
//  find user's location
//
//  Created by macbook on 7/1/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        let latDelta : CLLocationDegrees = 0.05
//        let longDelta : CLLocationDegrees = 0.05
//
//        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//        let coordinate = CLLocationCoordinate2D (latitude: latitude, longitude: longitude)
//        let region = MKCoordinateRegion (center: coordinate, span: span)
//        self.map.setRegion(region, animated: true)
        CLGeocoder().reverseGeocodeLocation(userLocation) {(placemarks, error) in
            if error != nil {
                print (error)
            } else {
                if let placemark = placemarks? [0]{
                    
                    var subThoroughfare = ""
                    if placemark.subThoroughfare != nil {
                        subThoroughfare = placemark.subThoroughfare!
                    }
                    
                    var thoroughfare = ""
                    if placemark.thoroughfare != nil {
                        thoroughfare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    if placemark.subLocality != nil {
                        subLocality = placemark.subLocality!
                    }
                    
                    var subAdministrativeArea = ""
                    if placemark.subAdministrativeArea != nil {
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    if placemark.postalCode != nil {
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    if placemark.country != nil {
                        country = placemark.country!
                    }
                    
                    print (subThoroughfare + thoroughfare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)
                }
            }
        }
    }
}
