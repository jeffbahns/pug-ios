//
//  AuthenticationResponse.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/20/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import Foundation

import UIKit

class AuthenticationResponse: NSObject {
    
    let response: [AnyObject]
    
    init(response: [AnyObject]) {
        self.response = response
        super.init()
    }
    
    func success() -> Bool {
        return self.response[0][AuthResponseAPI.auth_response] as! String == "pass"
    }
    
    func getUser() -> Player? {
        if success() {
            return Player(player: self.response[0][AuthResponseAPI.auth_response_user] as AnyObject)
        }
        return nil
    }
    
}
