//
//  HomeMapView.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 5/7/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation
import MapKit

extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is CourtAnnotation {
            let pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "myPin")
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "myPin")

            let courtPin = UIImage(named: "hoop")
            let size = CGSize(width: 44, height: 44)
            UIGraphicsBeginImageContext(size)
            courtPin?.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            view.image = resizedImage
            view.isEnabled = true
            view.canShowCallout = true
            if let cAnnotation = annotation as? CourtAnnotation {
                let courtImage = cAnnotation.court?.getImage()
                let size = CGSize(width: 44, height: 44)
                UIGraphicsBeginImageContext(size)
                courtImage?.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
                let resize = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                view.leftCalloutAccessoryView = UIImageView(image: resize)
            }
            
            //var rightButton: AnyObject! = UIButton(type: .detailDisclosure)
            view.rightCalloutAccessoryView = rightButton as! UIView

            return view
        }
        return nil
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? CourtAnnotation {
            self.selectedCourt = annotation
            performSegue(withIdentifier: "courtPinToCourt", sender: self)
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
                        let cannotation = CourtAnnotation(identifier: c.courtID()!, title: c.courtName()!, subtitle: "\(c.courtDistanceString()!) mi", court: c, coordinate: CLLocationCoordinate2D(latitude: c.courtLat()!,longitude: c.courtLong()!))
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
