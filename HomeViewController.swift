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
class HomeViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var dock: UIToolbar!

    let manager = CLLocationManager()
    var selectedCourt: CourtAnnotation? = nil
    
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
        
        if segue.identifier == "courtPinToCourt" {
            let courtVC = segue.destination as! CourtViewController
            courtVC.courtForThisView(court: (selectedCourt?.court)!)
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
