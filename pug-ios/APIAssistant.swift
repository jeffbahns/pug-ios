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
    let server_remote = true // true = remote, false = local
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
    
    func download_request() -> Bool {
        print("URL requested :: " + self.urlString)
        if let url = URL(string: urlString) {
            do {
                let contents = try String(contentsOf: url)
                //print("CONT:", contents)
                if let data = contents.data(using: .utf8) {
                    dataFromServer = try! JSONSerialization.jsonObject(with: data, options: []) as! [AnyObject]
                    print(dataFromServer)
                }
            } catch {
                print("CONTENTS :: BAD")
                // contents could not be loaded
                return false
            }
        } else {
            print("URL :: BAD!")
            return false
            // the URL was bad!
        }
        return true
    }
    
    func authorize_request(username: String, password: String) {
        if server_remote {
            self.urlString = API.auth_url + "?Username=\(username)&Password=\(password)"
        } else {
            self.urlString = API.auth_local_url + "?Username=\(username)&Password=\(password)"
        }
        self.download_request()
    }
    
    func locations_request(origin_lat: Double, origin_long: Double, radius: Int) {
        if server_remote {
            self.urlString = API.some_courts + "?origin_lat=\(origin_lat)&origin_long=\(origin_long)&radius=\(radius)"
        } else {
            self.urlString = API.some_courts + "?origin_lat=\(origin_lat)&origin_long=\(origin_long)&radius=\(radius)"
        }
        self.download_request()
    }
    
    func games_in_court_request(courtID: Int) {
        if server_remote {
            self.urlString = API.base_url + API.games_in_court + String(courtID)
        } else {
            self.urlString = API.base_url_local + API.games_in_court + String(courtID)
        }
        self.download_request()
    }
    
    func players_in_game_request(gameID: Int) {
        if server_remote {
            self.urlString = API.base_url + API.players_in_game + String(gameID)
        } else {
            self.urlString = API.base_url_local + API.players_in_game + String(gameID)
        }
        self.download_request()
    }
    
    func player_by_id(playerID: Int) {
        if server_remote {
            self.urlString = API.base_url + API.player_by_id + String(playerID)
        } else {
            self.urlString = API.base_url_local + API.player_by_id + String(playerID)
        }
        self.download_request()
    }
    
    func insert_game(gameDateTime: String, gameName: String, gameDuration: Int,
                     gameSkillLevel: String, courtID: Int, creatorID: Int) -> Bool {
        if server_remote {
            self.urlString = API.base_url + API.insert_game
        } else {
            self.urlString = API.base_url_local + API.insert_game
        }
        self.urlString += "?GameDateTime=\(gameDateTime)&GameName=\(gameName)&GameDuration=\(gameDuration)"
        self.urlString += "&GameSkillLevel=\(gameSkillLevel)&CourtID=\(String(courtID))&CreatorID=\(String(creatorID))"
        return self.download_request()
        
    }
}
