//
//  GameDataSource.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/18/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation

import UIKit

class GameDataSource: NSObject {
    
    var games: [AnyObject]
    
    init(dataSource: [AnyObject]) {
        self.games = dataSource
        super.init()
    }
    
    func numgames() -> Int{
        return games.count
    }
    
    func gameAt(_ index: Int) -> Game {
        let game = Game( game: self.games[index] )
        return game
    }
}
