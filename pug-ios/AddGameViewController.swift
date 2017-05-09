//
//  AddGameViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns & Bryan Ward on 4/21/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

    @IBOutlet weak var placetextfield: UITextField!
    @IBOutlet weak var gameDatePicker: UIDatePicker!
    @IBOutlet weak var titleTextfield: UITextField!
    
    
    
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
        formatter.dateFormat = "MMMM dd,YYYY"
        let date = formatter.string(from: gameDatePicker.date)
        
        formatter.dateFormat = "HH:mm"// "hh:mm a" for 12 hour clock  
        let time = formatter.string(from: gameDatePicker.date)
     
        
        print ("this is the date ", date, "and the time " ,time)
        print(" this is the title ", title, " and this is place ", place)
        
        
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
