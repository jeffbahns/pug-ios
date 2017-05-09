//
//  AddGameViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns & Bryan Ward on 4/21/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource { 
    
    
    @IBOutlet weak var pickerView: UIPickerView!

    @IBOutlet weak var gameDatePicker: UIDatePicker!
    @IBOutlet weak var titleTextfield: UITextField!
    var api = APIAssistant()
    var pickerData: [String] = [String]()
    var place = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self

        
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        place = pickerData[row]
    }
    
    
    
    
    
    @IBAction func addGameBotton(_ sender: Any) {
        
//        print("this is the place ", place)
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
