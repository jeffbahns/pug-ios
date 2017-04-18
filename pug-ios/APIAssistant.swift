//
//  APIAssistant.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/17/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation
import UIKit

// globals for accessing API
struct API {
    static let base_url = "https://enigmatic-tundra-24206.herokuapp.com/api"
    static let all_games = API.base_url + "/all_games/"
    static let all_players = API.base_url + "/all_players/"
    static let all_courts = API.base_url + "/all_courts/"
}

// globals set here for all database structures
// in case they are changed, they can be easily modified here
struct GameAPI {
    static let game_date_time = "GameDateTime"
    static let game_name = "GameName"
    static let game_duration = "GameDuration"
    static let game_skill_level = "SkillLevel"
    static let game_id = "GameID"
    static let game_court_id = "CourtID"
    static let game_player_id = "CreatorID"
}

struct CourtAPI {
    static let court_name = "CourtName"
    static let court_address = "Address"
    static let court_city = "City"
    static let court_state = "State"
    static let court_zip = "ZipCode"
    static let court_id = "CourtID"
}

struct PlayerAPI {
    static let player_username = "Username"
    static let player_first_name = "FirstName"
    static let player_last_name = "LastName"
    static let player_password = "Password"
    static let player_phone_number = "PhoneNumber"
    static let player_age = "Age"
    static let player_id = "PlayerID"
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
