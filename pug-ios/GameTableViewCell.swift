//
//  GameTableViewCell.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 5/3/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var gameUserImage: UIImageView!
    @IBOutlet weak var gameDateTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func useGame(_ game: Game) {
        if let name = game.gameName() {
            gameLabel.text = name
        }
        if let player = game.playerUsername() {
            creatorLabel.text = player
        }
        let p = Player(player: game.game)
        if let playerImage = p.getImage(){
            gameUserImage.image = playerImage
        }
        if let dateTime = game.gameTime() {
            gameDateTimeLabel.text = displayDate(dateTime: dateTime)
        }
    }

}

extension UITableViewCell {
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
