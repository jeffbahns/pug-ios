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
    
    let player = PlayerCoreData()
    
    var api = APIAssistant()
    var pickerData: [String] = [String]()
    var pickedCourt: Court?
    let currentDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        gameDatePicker.minimumDate = currentDate;
        player.getUserCoreData()
        self.pickedCourt = (courtDS?.courtAt(0))!
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
        self.pickedCourt = (courtDS?.courtAt(row))!    }
    
    @IBAction func addGameBotton(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMddHHmm"
        
        let dateTime = formatter.string(from: gameDatePicker.date)
        let currentDateTime = formatter.string(from: currentDate)
        if let title = titleTextfield.text,
            let courtID = self.pickedCourt?.courtID(),
            dateTime >= currentDateTime {
            //print("\(title), \(dateTime), \(courtID)")
            let formattedTitle = title.replacingOccurrences(of: " ", with: "%20")
            
            let playerid = player.getPlayerID()
            player.deleteCoreData()
            player.coreDataTester()
            
            if api.insert_game(gameDateTime: dateTime, gameName: formattedTitle, gameDuration: 1, gameSkillLevel: "C", courtID: courtID, creatorID: playerid  ) {
                var gameMessage = "You have created a game at "

                gameMessage = gameMessage + (pickedCourt?.courtName())!

                let alertController = UIAlertController(title: "SUCCESS", message: gameMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                    print("You've pressed OK button");
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
                print("game creation SUCCESS")
                
            }else {
                let error = "Game has not been created"
                let alertController = UIAlertController(title: "FAIL", message: error, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                    print("You've pressed OK button");
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)

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
