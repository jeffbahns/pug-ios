//
//  CourtTableViewCell.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 5/1/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class CourtTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func useCourt(_ court: Court) {
        if let courtImage = court.getImage() {
            cellImage.image = courtImage
        }
        if let name = court.courtName() {
            cellLabel.text = name
        }
        if let distance = court.courtDistanceString() {
            distanceLabel.text = "\(distance) mi"
        }

    }
}
