//
//  CourtViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 5/3/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class CourtViewController: UIViewController {
    var court: Court? = nil
    var apiAssist = APIAssistant()
    
    @IBOutlet weak var courtImage: UIImageView!
    @IBOutlet weak var courtAddressLabel: UILabel!
    @IBOutlet weak var courtDistanceLabel: UILabel!
    @IBOutlet weak var courtAvailableGamesLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if court != nil {
            if let cN = court?.courtName() {
                self.title = cN
            }
            if let cI = court?.getImage() {
                courtImage.image = cI
            }
            if let address = court?.courtAddress(),let city = court?.courtCity(),
                let state = court?.courtState(), let zip = court?.courtZip() {
                courtAddressLabel.text = "\(address), \(city), \(state), \(zip)"
            }
            if let distance = court?.courtDistanceString() {
                courtDistanceLabel.text = "\(distance) miles away"
            }
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func courtForThisView(court: Court) {
        self.court = court
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "courtToGame" {
            var gameTVC = segue.destination as! GameTableViewController
            gameTVC.courtID = court?.courtID()
        }
        
        if segue.identifier == "courtToAddGame" {
            var addGameVC = segue.destination as! AddGameViewController
            var cds = CourtDataSource(dataSource: [(self.court?.court)!])
            addGameVC.courtDSForThisView(courtDS: cds)
        }
    }
 

}
