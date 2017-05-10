//
//  AddGameViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns & Bryan Ward on 4/21/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var courtDS: CourtDataSource?
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var gameDatePicker: UIDatePicker!
    @IBOutlet weak var titleTextfield: UITextField!
    
    var api = APIAssistant()
    var pickerData: [String] = [String]()
    var pickedCourtID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func courtDSForThisView(courtDS: CourtDataSource) {
        self.courtDS = courtDS
    }
    
    // picker view components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let cds = courtDS {
            return cds.numCourts()
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return courtDS?.courtAt(row).courtName()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickedCourtID = courtDS?.courtAt(row).courtID()
    }
    
    @IBAction func addGameBotton(_ sender: Any) {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMddHHmm"
        
        let dateTime = formatter.string(from: gameDatePicker.date)
        let currentDateTime = formatter.string(from: currentDate)
        if let title = titleTextfield.text,
            let courtID = self.pickedCourtID,
            dateTime >= currentDateTime {
            //print("\(title), \(dateTime), \(courtID)")
            let formattedTitle = title.replacingOccurrences(of: " ", with: "%20")
            
            if api.insert_game(gameDateTime: dateTime, gameName: formattedTitle, gameDuration: 1, gameSkillLevel: "C", courtID: courtID, creatorID: 4) {
                print("game creation SUCCESS")
            } else {
                print("game creation FAIL")
            }
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
