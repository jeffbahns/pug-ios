//
//  HomeViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/20/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    var manager:CLLocationManager!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dock: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        // Do any additional setup after loading the view.
        
        // set initial location in Honolulu
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let initialLocation = CLLocation(latitude: Locations.ssu_lat, longitude: Locations.ssu_long)
        let regionRadius: CLLocationDistance = 10000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: initialLocation)
        
        
    }
    @IBAction func addGame(_ sender: Any) {
        performSegue(withIdentifier: "homeToAddGame", sender: nil)
    }
    
}
