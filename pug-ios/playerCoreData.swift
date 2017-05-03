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



class playerCoreData: NSObject{
    
  
    
    func addToCoreData (p: Player)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        print("I am here ")
        let playerCD = Player_(context:context)
        
//        playerCD.username = "Username12"
//        playerCD.player_age = 128;
//        playerCD.player_first_name = "Bryan5"
//        playerCD.player_last_name = "War1"
//        playerCD.player_id = 334
        
        
//        playerCD.username = p.playerUsername()
//        playerCD.player_age = p.playerAge()!
//        playerCD.player_first_name = p.playerFirstName()
//        playerCD.player_last_name = p.playerLastName()
 //       playerCD.player_id = p.playerID()!
//
        
        appDelegate.saveContext()
        
        
        //return true;
   }
    func coredataTester()  {
//        
//    
//        // test to see if core data is working
        do {
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            
           let context = appDelegate.persistentContainer.viewContext
//
//           // var playerCD = Player_(context:context)

            let result = try context.fetch(Player_.fetchRequest())
            
            let playersCD = result as! [Player_]

            
            for playerCD in playersCD {
                print("username: \(String(describing: playerCD.username))")
                print("player_age: \(playerCD.player_age)")
                print("player first name: \(String(describing: playerCD.player_first_name))")
                print("player last name: \(String(describing: playerCD.player_last_name))")
                print("player_id: \(playerCD.player_id)")
                
            }
        }catch {
            print("Error")
        }
        
    }
    
    
    func deleteCoreData() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        print("I am here delete")
        let playerCD = Player_(context:context)
        context.delete(playerCD)
    }
   
    func getUsercoredata(username: string)  ->{
        //
        //
        //        // test to see if core data is working
        do {
            let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            //
            //           // var playerCD = Player_(context:context)
            
            let result = try context.fetch(Player_.fetchRequest())
            
            let playersCD = result as! [Player_]
            
            
            for playerCD in playersCD {
                print("username: \(String(describing: playerCD.username))")
                print("player_age: \(playerCD.player_age)")
                print("player first name: \(String(describing: playerCD.player_first_name))")
                print("player last name: \(String(describing: playerCD.player_last_name))")
                print("player_id: \(playerCD.player_id)")
                
            }
        }catch {
            print("Error")
        }
        
    }

    
    
}
    


    
    
    
    


//let appDelegate = (UIApplication.shared.delegate) as! AppDelegate


