//
//  court.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/18/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation
import UIKit

class Court: NSObject {
    
    let court: AnyObject
    
    init(court: AnyObject) {
        self.court = court
        super.init()
    }
    
    func courtLat() -> Double? {
        if let a = court[CourtAPI.court_coord_lat] {
            return a as? Double
        }
        return nil
    }
    
    func courtLong() -> Double? {
        if let a = court[CourtAPI.court_coord_long] {
            return a as? Double
        }
        return nil
    }
    
    func courtDistanceMiles() -> Double? {
        if let a = court[CourtAPI.court_distance_mi] {
            return a as? Double
        }
        return nil
    }
    
    func courtName() -> String? {
        if let a = court[CourtAPI.court_name] {
            return a as? String
        }
        return nil
    }
    
    func courtAddress() -> String? {
        if let a = court[CourtAPI.court_address] {
            return a as? String
        }
        return nil
    }
    
    func courtCity() -> String? {
        if let a = court[CourtAPI.court_city] {
            return a as? String
        }
        return nil
    }
    
    func courtState() -> String? {
        if let a = court[CourtAPI.court_state] {
            return a as? String
        }
        return nil
    }
    
    func courtSkillLevel() -> Int? {
        if let a = court[CourtAPI.court_id] {
            return a as? Int
        }
        return nil
    }
    
    func courtID() -> Int? {
        if let a = court[CourtAPI.court_id] {
            return a as? Int
        }
        return nil
    }
}
