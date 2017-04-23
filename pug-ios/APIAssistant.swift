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
    
    func download_request() {
        print("using this shit: " + self.urlString)
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                if let data = contents.data(using: .utf8) {
                    dataFromServer = try! JSONSerialization.jsonObject(with: data, options: []) as! [AnyObject]
                }
            } catch {
                // contents could not be loaded
            }
        } else {
            // the URL was bad!
        }
    }
    
    func authorize_request(username: String, password: String) {
        //self.urlString = API.auth_url + "?Username=\(username)&Password=\(password)"
        self.urlString = API.auth_local_url + "?Username=\(username)&Password=\(password)"
        self.download_request()
    }
}
