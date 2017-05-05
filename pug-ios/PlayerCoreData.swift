//
//  playerCoreData.swift
//  pug-ios
//
//  Created by Bryan Ward on 4/25/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PlayerCoreData: NSObject{

    func addToCoreData (p: Player) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let playerCD = Player_(context:context)
        
        playerCD.username = p.playerUsername()!
        playerCD.player_age = Int16(p.playerAge()!)
        playerCD.player_first_name = p.playerFirstName()!
        playerCD.player_last_name = p.playerLastName()!
        playerCD.player_id = Int16(p.playerID()!)
        
        appDelegate.saveContext()
        //return true;
    }
    
    func coreDataTester() {
        // test to see if core data is working
        do {
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            // var playerCD = Player_(context:context)
            let result = try context.fetch(Player_.fetchRequest())
            let playersCD = result as! [Player_]

            for playerCD in playersCD {
                print("username: \(String(describing: playerCD.username))")
                print("player_age: \(playerCD.player_age)")
                print("player first name: \(String(describing: playerCD.player_first_name))")
                print("player last name: \(String(describing: playerCD.player_last_name))")
                print("player_id: \(playerCD.player_id)")
            }
        } catch {
            print("Error")
        }
    }
    
    func deleteCoreData() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let playerCD = Player_(context:context)
        context.delete(playerCD)
    }
   
    func getUserCoreData(username: String) -> Bool {
        // test to see if core data is working
        do {
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            // var playerCD = Player_(context:context)
            let result = try context.fetch(Player_.fetchRequest())
            let playersCD = result as! [Player_]
            
            for playerCD in playersCD {
                print("username: \(String(describing: playerCD.username))")
                print("player_age: \(playerCD.player_age)")
                print("player first name: \(String(describing: playerCD.player_first_name))")
                print("player last name: \(String(describing: playerCD.player_last_name))")
                print("player_id: \(playerCD.player_id)")
                return true
            }
        } catch {
            print("Error")
            return false
        }
        return false
    }
    
}

//let appDelegate = (UIApplication.shared.delegate) as! AppDelegate


