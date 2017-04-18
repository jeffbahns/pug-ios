//
//  APIAssistant.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/17/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation
import UIKit

struct API {
    static let base_url = "https://enigmatic-tundra-24206.herokuapp.com/api"
    static let all_games = API.base_url + "/all_games/"
    static let all_players = API.base_url + "/all_players/"
    static let all_courts = API.base_url + "/all_courts/"
}

class APIAssistant: NSObject {
    
    var urlString: String
    dynamic var dataFromServer: [AnyObject]?
    
    init(withURLString: String) {
        urlString = withURLString
        super.init()
    }
    
    func download_request() {
        if let url = URL(string: urlString) {
            do {
                var contents = try String(contentsOf: url)
                contents = contents.replacingOccurrences(of: "&#34;", with: "\"", options: .literal, range: nil)
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
}
