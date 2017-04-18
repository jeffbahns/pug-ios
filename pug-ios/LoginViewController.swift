//
//  LoginViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/12/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var dataObject: String = ""
    var gamesDS: GameDataSource?
    
    var apiAssistant = APIAssistant(withURLString: API.all_games)
    //var apiAssistant = APIAssistant(withURLString: "http://headers.jsontest.com/")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("making request with \(API.all_players)")
        apiAssistant.download_request()
        gamesDS = GameDataSource(dataSource: apiAssistant.dataFromServer!)
        print(gamesDS?.numgames())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
