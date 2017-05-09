//
//  CourtAnnotation.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/26/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation
import MapKit
import AddressBook

class CourtAnnotation: NSObject, MKAnnotation
{
    let identifier : Int
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let court: Court?
    
    init(identifier: Int, title: String, subtitle: String, court: Court, coordinate: CLLocationCoordinate2D)
    {
        self.identifier = identifier
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.court = court
        super.init()
    }
    
    func mapItem() -> MKMapItem
    {
        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}
