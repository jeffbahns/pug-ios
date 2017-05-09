//
//  CourtViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 5/3/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class CourtViewController: UIViewController {
    var court: Court?
    var apiAssist = APIAssistant()
    
    @IBOutlet weak var courtImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("court view was loaded: \(court?.courtName())")
        self.title = court?.courtName()!
        if let cI = court?.getImage() {
            courtImage.image = cI
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
            print("Giving court id a destination")
            var gameTVC = segue.destination as! GameTableViewController
            gameTVC.courtID = court?.courtID()
        }
    }
 

}
