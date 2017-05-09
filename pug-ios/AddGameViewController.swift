//
//  AddGameViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns & Bryan Ward on 4/21/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {
    @IBOutlet weak var pickerView: UIPickerView!

    @IBOutlet weak var placetextfield: UITextField!
    @IBOutlet weak var gameDatePicker: UIDatePicker!
    @IBOutlet weak var titleTextfield: UITextField!
    var api = APIAssistant()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addGameBotton(_ sender: Any) {
        
        
        let place = placetextfield.text!
        let title = titleTextfield.text!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMddHHmm"
        let dateTime = formatter.string(from: gameDatePicker.date)
        //api.insert_game(gameDateTime: dateTime, gameName: titleTextfield.text!, gameDuration: 1, gameSkillLevel: "C", courtID: <#T##Int#>, creatorID: <#T##Int#>)
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
