//
//  HomeViewController.swift
//  pug-ios
//
//  Created by Jeffrey Bahns on 4/20/17.
//  Copyright © 2017 Jeffrey Bahns. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: CLLocationManager {

    override func viewDidLoad() {
        super.viewDidLoad()

        var locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
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
