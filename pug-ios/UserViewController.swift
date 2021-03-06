//
//  UserViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 5/3/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    var user: Player?
    var userID: Int?
    var api = APIAssistant()
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userAgeLabel: UILabel!
    @IBOutlet weak var userRealNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if user == nil {
            api.player_by_id(playerID: userID!)
            user = Player(player: api.data()![0] as AnyObject)
        }
        
        if let name = user?.playerUsername() {
            //self.title = name
            userNameLabel.text = name
        }
        if let img = user?.getImage() {
            self.userImage.image = img
            self.userImage.setRounded()
        }
        if let fName = user?.playerFirstName(),
            let lName = user?.playerLastName() {
            //self.title = name
            userRealNameLabel.text = "\(fName) \(lName)"
        }
        if let age = user?.playerAge() {
            userAgeLabel.text = "\(age)"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userForThisView(user: Player) {
        self.user = user
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
