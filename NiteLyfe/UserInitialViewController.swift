//
//  UserInitialViewController.swift
//  NiteLyfe
//
//  Created by Jonah Zukosky on 10/13/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import UIKit
import MapKit
class UserInitialViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let regionRadius:CLLocationDegrees = 2000
        let initialLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(38.951705, -92.334072)
        // 1000 meters: alittle more than half a mile
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(initialLocation, regionRadius, regionRadius), animated: true)
        
        let myPin = pinAnnotation(title: "Tiger Hacks", subtitle:"Subtitle", coordinate: initialLocation)
        
        mapView.addAnnotation(myPin)
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
