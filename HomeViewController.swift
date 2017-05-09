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

/*
protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}
*/
class HomeViewController: UIViewController  {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dock: UIToolbar!

    let manager = CLLocationManager()

    var resultSearchController:UISearchController? = nil
    var selectedPin:MKPlacemark? = nil
    
    var apiAssistant: APIAssistant?
    var courtDS: CourtDataSource?
    
    
    let playerCD = PlayerCoreData()
    override func viewDidLoad() {
        super.viewDidLoad()

        apiAssistant = APIAssistant()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
        mapView.delegate = self
        /*
        // search table shit
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTableViewController") as!    LocationSearchTableViewController
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
         */
    }
    
    
    @IBAction func addGame(_ sender: Any) {
        performSegue(withIdentifier: "homeToAddGame", sender: nil)
    }
    
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToUser" {
            var userVC = segue.destination as! UserViewController
            userVC.userID = 5
        }
     }
 
}

extension HomeViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let radius = Double(15)
            let delta = radius / 69.0
            self.apiAssistant?.locations_request(origin_lat: location.coordinate.latitude,
                                        origin_long: location.coordinate.longitude,
                                        radius: 100)
            self.courtDS = CourtDataSource(dataSource: (self.apiAssistant?.data())!)
            if let x = self.courtDS?.numCourts() {
                for i in 0 ..< x {
                    if let c = courtDS?.courtAt(i) {
                        let cannotation = CourtAnnotation(identifier: c.courtID()!, title: "court name", subtitle: "sub", coordinate: CLLocationCoordinate2D(latitude: c.courtLat()!,longitude: c.courtLong()!))
                        mapView.addAnnotation(cannotation)
                    }
                }
            }
            
            let span = MKCoordinateSpanMake(0.5, 0.5)
            //let region = MKCoordinateRegion(center: location.coordinate, span: span)
            //mapView.setRegion(region, animated: true)
            
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            var currentRegion = region
            currentRegion.span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
            self.mapView.region = currentRegion
            
        }
    }
    
}
/*
extension HomeViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        print("Title: \(placemark.name)\n"
            + "CountryAbr: \(placemark.countryCode)\n"
            + "CountryFull: \(placemark.country)\n"
            + "Address: \(placemark.thoroughfare)\n"
            + "City: \(placemark.locality)\n"
            + "Zip: \(placemark.postalCode)\n"
            + "\(placemark)"
        )
        
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
}
*/
