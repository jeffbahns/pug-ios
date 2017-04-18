//
//  CourtDataSource.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/18/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation

import UIKit

class CourtDataSource: NSObject {
    
    var courts: [AnyObject]
    
    init(dataSource: [AnyObject]) {
        self.courts = dataSource
        super.init()
    }
    
    func numCourts() -> Int{
        return courts.count
    }
    
    func CourtAt(_ index: Int) -> Court {
        let court = Court( court: self.courts[index] )
        return court
    }
}
