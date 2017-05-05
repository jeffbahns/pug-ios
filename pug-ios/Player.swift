//
//  Player.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/18/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation

import UIKit

class Player: NSObject {
    
    let player: AnyObject
    
    init(player: AnyObject) {
        self.player = player
        super.init()
    }

    
    func playerUsername() -> String? {
        if let a = player[PlayerAPI.player_username] {
            return a as? String
        }
        return nil
    }
    
    func playerFirstName() -> String? {
        if let a = player[PlayerAPI.player_first_name] {
            return a as? String
        }
        return nil
    }
    
    func playerLastName() -> String? {
        if let a = player[PlayerAPI.player_last_name] {
            return a as? String
        }
        return nil
    }
    
    func playerPassword() -> String? {
        if let a = player[PlayerAPI.player_password] {
            return a as? String
        }
        return nil
    }
    
    func playerPhoneNumber() -> String? {
        if let a = player[PlayerAPI.player_phone_number] {
            return a as? String
        }
        return nil
    }
    
    func playerID() -> Int32? {
        if let a = player[PlayerAPI.player_id] {
            return a as? Int32
        }
        return nil
    }
    
    func playerAge() -> Int32? {
        //if let a = player[PlayerAPI.player_age] {
        let a: Int32 = 0
            return a
    }
    
}
