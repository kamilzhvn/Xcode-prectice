//
//  ViewController.swift
//  map integrating
//
//  Created by macbook on 6/26/19.
//  Copyright © 2019 macbook. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let latitude: CLLocationDegrees = 27.175244
        let longitude : CLLocationDegrees = 78.042166
        let latDelta : CLLocationDegrees = 0.05
        let lonDelta : CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D (latitude: latitude, longitude: longitude)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = " Taj mahal"
        annotation.coordinate = location
        annotation.subtitle = "Kamil is the best person"
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer (target: self, action: #selector(ViewController.longPress(gestureRecognizer :)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        
    }
    @objc func longPress(gestureRecognizer : UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.title = " New Place "
        annotation.coordinate = coordinate
        annotation.subtitle = " May be I'll go here too..."
        map.addAnnotation(annotation)
        
    }

    
}

