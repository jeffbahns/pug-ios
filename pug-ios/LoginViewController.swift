    //
//  LoginViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/12/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//


import UIKit
    
import CoreData

class LoginViewController: UIViewController {
    var dataObject: String = ""
    var gamesDS: GameDataSource?
    var playerDS: PlayerDataSource?
    //var apiAssistant = APIAssistant(withURLString: API.all_games)
    var apiAssistant = APIAssistant(withURLString: "http://localhost:3000/api/all_games")
    var authAssistant: APIAssistant?
    
    let diditwork = playerCoreData()

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diditwork.addToCoreData();
        diditwork.coredataTester();
        
     
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginUser(_ sender: Any) {
        authAssistant = APIAssistant()
        authAssistant?.authorize_request(username: usernameTextField.text!, password: passwordTextField.text!)
        //let loginResponse = AuthenticationResponse(response: (authAssistant?.dataFromServer!)!)
        
            //if (loginResponse.success()) {
        if (true) {
            //let p = loginResponse.getUser()
            //print(p)
            

            
            performSegue(withIdentifier: "loginToHome", sender: nil)
            
                   }
        else {
            print("Failed to log in, could be username/password error")
        }

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
