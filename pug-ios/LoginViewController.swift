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
    var playerDS: PlayerDataSource?
    var apiAssistant = APIAssistant(withURLString: "http://localhost:3000/api/all_games")
    var authAssistant: APIAssistant?
    let playerCD = PlayerCoreData()
    
    var alert: UIAlertController!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if playerCD.getUserCoreData() {
            //performSegue(withIdentifier: "loginToHome", sender: nil)
        }
        
    }
    
    @IBAction func loginUser(_ sender: Any) {
        authAssistant = APIAssistant()
        if ((authAssistant?.authorize_request(username: usernameTextField.text!, password: passwordTextField.text!)) != nil), let data = authAssistant?.dataFromServer! {
            if let p: Player? = Player(player: data[0] as AnyObject) {
                //playerCD.deleteCoreData()
                playerCD.addToCoreData(p: p!)
                //playerCD.coreDataTester()
                let userMessage = "\(p?.playerUsername()) was successfully logged in"
                //self.notifyUser(title: "Success", message: userMessage, timeToDissapear: 1)
                performSegue(withIdentifier: "loginToHome", sender: nil)
            }
        } else {
            let userMessage = "Login was unsuccessful"
            //self.notifyUser(title: "Failure", message: userMessage, timeToDissapear: 1)
        }
    }
    

    
    func notifyUser(title: String, message: String, timeToDissapear: Int) -> Void
    {
        alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "OK",
                                         style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        UIApplication.shared.keyWindow?.rootViewController!.present(alert, animated: true,
                                                                                               completion: nil)
        
        // setting the NSTimer to close the alert after timeToDissapear seconds.
        _ = Timer.scheduledTimer(timeInterval: Double(timeToDissapear), target: self, selector: Selector(("dismissAlert")), userInfo: nil, repeats: false)
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
