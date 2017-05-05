//
//  SignupViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/18/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    
    var Firstname = ""
    var lastname = ""
    var username = ""
    var password = ""
    var phoneNumber = ""
    var age = 43333219
    var thereIsAnErrer = false
    var error = "there is no text in "
    
    var ageNumbers = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var firstNameTextField: UITextField!

    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    
    @IBOutlet weak var ageTextfield: UITextField!
    
    
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        for i in 0...99{
         
            ageNumbers[i] = i+1
        }
        
        
        
    }
    
    
    
    
    @IBAction func SignupBotton(_ sender: Any) {
        
         Firstname = firstNameTextField.text!
         lastname = lastNameTextField.text!
         username = usernameTextField.text!
         password = passwordTextfield.text!
         phoneNumber = phoneNumberTextfield.text!
        
        if(ageTextfield.text! == ""){
            thereIsAnErrer = true
            error = error + "\n age "
           
        }else{

          age = Int(ageTextfield.text!)!

            


        }
        
            if (Firstname == ""){
                thereIsAnErrer = true
               error = error + "\n first name "
            }
            if(lastname == ""){
                error = error + "\n last name "
                thereIsAnErrer = true

            }
            if (username == ""){
                error = error + "\n username "
                thereIsAnErrer = true


            }
            if (passwordTextfield.text! == ""){
                error = error + "\n password "
                thereIsAnErrer = true
        }
        if(thereIsAnErrer == true){
                let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                    print("You've pressed OK button");
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
                
        }

        
        
  print("firstname ",Firstname,"\n last name ",lastname,"\n username ", username
        ,"\n password ",password,"\n phoneNumber ",phoneNumber, "\n age ",age)
        
        
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
