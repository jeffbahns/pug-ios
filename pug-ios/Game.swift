//
//  Game.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/18/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation

import UIKit

class Game: NSObject {
    
    let game: AnyObject
    
    init(game: AnyObject) {
        self.game = game
        super.init()
    }
    
    func gameDate() -> String? {
        if let a = game[GameAPI.game_date_time] {
            return a as? String
        }
        return nil
    }
    
    func gameTime() -> String? {
        if let a = game[GameAPI.game_date_time] {
            return a as? String
        }
        return nil
    }
    
    func gameName() -> String? {
        if let a = game[GameAPI.game_name] {
            return a as? String
        }
        return nil
    }
    
    func gameSkillLevel() -> String? {
        if let a = game[GameAPI.game_skill_level] {
            return a as? String
        }
        return nil
    }
    
    func gameID() -> Int? {
        if let a = game[GameAPI.game_id] {
            return a as? Int
        }
        return nil
    }
    
    func gameCourtID() -> Int? {
        if let a = game[GameAPI.game_court_id] {
            return a as? Int
        }
        return nil
    }
    func gamePlayerID() -> Int? {
        if let a = game[GameAPI.game_player_id] {
            return a as? Int
        }
        return nil
    }
    
    /* player related stuff */
    func playerUsername() -> String? {
        if let a = game[PlayerAPI.player_username] {
            return a as? String
        }
        return nil
    }
}
