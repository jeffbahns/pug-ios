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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func useCourt(_ court: Court) {
        if let courtImage = court.getImage() {
            cellImage.image = courtImage
        }
        cellLabel.text = court.courtName()
        let distance = String(format: "%.1f", court.courtDistance()!)
        distanceLabel.text = "\(distance) mi"
    }
}
