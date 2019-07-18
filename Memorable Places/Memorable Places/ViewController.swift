//
//  ViewController.swift
//  Memorable Places
//
//  Created by macbook on 7/2/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let uilpgr = UILongPressGestureRecognizer (target: self, action: #selector(ViewController.longPress(gestureRecognizer :)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        if activePlace != -1{
            if places.count>activePlace{
                if let name = places[activePlace]["name"]{
                    if let lat = places[activePlace]["latitude"]{
                        if let lon = places[activePlace]["longitude"]{
                            if let latitude = Double(lat){
                                if let longitude = Double (lon){
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    self.map.setRegion(region, animated: true)
                                    let annotation = MKPointAnnotation()
                                    annotation.title = name
                                    annotation.coordinate = coordinate
                                    annotation.subtitle = "Kamil is the best person"
                                    map.addAnnotation(annotation)
                                }
                            }
                        }
                    }
                }
            }
        } else {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        self.map.setRegion(region, animated: true)
    }

    @objc func longPress(gestureRecognizer : UIGestureRecognizer){
        
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            
            let touchPoint = gestureRecognizer.location(in: self.map)
            let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            var title = ""
            
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if error != nil{
                    print(error as Any)
                } else {
                    if let placemark = placemarks?[0]{
                        
                        if placemark.subThoroughfare != nil {
                            title += placemark.subThoroughfare! + " "
                        }
                
                        if placemark.thoroughfare != nil {
                            title +=  placemark.thoroughfare!
                        }
                        
                    }
                }
                if title == ""{
                    title = "Added \(NSDate())"
                }
                let annotation = MKPointAnnotation()
                annotation.title = " New memorable place "
                annotation.coordinate = newCoordinate
                self.map.addAnnotation(annotation)
                places.append(["name": title, "latitude": String(newCoordinate.latitude), "longitude": String (newCoordinate.longitude)])
                UserDefaults.standard.set(places, forKey: "places")
                print(places)
            }
            
        }
        
       
        
    }

}







