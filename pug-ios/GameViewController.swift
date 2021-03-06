//
//  GameViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 5/3/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var game: Game?
    var player: Player?
    @IBOutlet weak var gameCreator: UILabel!
    @IBOutlet weak var gameDateTime: UILabel!
    @IBOutlet weak var gameCreatorImage: UIImageView!
    
    let playerCD = PlayerCoreData()
    var server = APIAssistant()
    
    @IBOutlet weak var gameJoinButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let gt = game?.gameName() {
            self.title = gt
        }
        if let gdt = game?.gameDate() {
            gameDateTime.text = displayDate(dateTime: gdt)
        }
        
        playerCD.getUserCoreData()
        player = Player(player: (game?.game)!)
        if let image = player?.getImage() {
            gameCreatorImage.image = image
            gameCreatorImage.setRounded()
        }
        
        if let username = player?.playerUsername() {
            gameCreator.text = username
            if let stored = playerCD.getUsername(),
                stored == username {
                gameJoinButton.isHidden = true
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func gameForThisView(game: Game) {
        self.game = game

    }

    @IBAction func joinGame(_ sender: Any) {
        if let gID = game?.gameID() {
            server.join_game(playerID: playerCD.getPlayerID(), gameID: gID)
        }
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameToUser" {
            var userTVC = segue.destination as! UserTableViewController
            userTVC.gameID = game?.gameID()
        }
    }

}

extension UIViewController {
    func displayDate(dateTime: String) -> String {
        let year = dateTime[0...3]
        let month = dateTime[4...5]
        let day = dateTime[6...7]
        var ampm = "AM"
        var hour = Int(dateTime[8...9])
        let min = dateTime[10...11]
        if hour! >= 12 {
            ampm = "PM"
        }
        hour = hour! % 12
        if hour == 0 {
            hour = 12
        }
        return "\(month)/\(day)/\(year), \(hour!):\(min) \(ampm)"
    }
}

extension String {
    subscript (r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex...endIndex]
        }
    }
}
