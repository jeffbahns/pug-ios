//
//  APIAssistant.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/17/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation
import UIKit

class APIAssistant: NSObject {
    
    var urlString: String
    dynamic var dataFromServer: [AnyObject]?
    
    init(withURLString: String) {
        urlString = withURLString
        super.init()
    }
    
    override init() {
        self.urlString = ""
        super.init()
    }
    
    func data() -> [AnyObject]? {
        if dataFromServer != nil {
            return dataFromServer
        }
        return nil
    }
    
    func download_request() {
        print("URL requested :: " + self.urlString)
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                //print("CONT:", contents)
                if let data = contents.data(using: .utf8) {
                    dataFromServer = try! JSONSerialization.jsonObject(with: data, options: []) as! [AnyObject]
                    //print(dataFromServer)
                }
            } catch {
                print("CONTENTS :: BAD")
                // contents could not be loaded
            }
        } else {
            print("URL :: BAD!")
            // the URL was bad!
        }
    }
    
    func authorize_request(username: String, password: String) {
        //self.urlString = API.auth_url + "?Username=\(username)&Password=\(password)"
        self.urlString = API.auth_local_url + "?Username=\(username)&Password=\(password)"
        self.download_request()
    }
    
    func locations_request(origin_lat: Double, origin_long: Double, radius: Int) {
        self.urlString = API.some_courts_local + "?origin_lat=\(origin_lat)&origin_long=\(origin_long)&radius=\(radius)"
        self.download_request()
    }
    
    func games_in_court_request(courtID: Int) {
        self.urlString = API.games_in_court + String(courtID)
        self.download_request()
    }
}
