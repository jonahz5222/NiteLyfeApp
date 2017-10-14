//
//  pinAnnotation.swift
//  NiteLyfeApp
//
//  Created by Ochirnyam's Mac on 10/14/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import MapKit

class pinAnnotation: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    init?(json: [Any]) {
        // 1
        self.title = json[16] as? String ?? "No Title"
        self.locationName = json[12] as! String
        self.discipline = json[15] as! String
        // 2
        if let latitude = Double(json[18] as! String),
            let longitude = Double(json[19] as! String) {
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
    }
    var subtitle: String? {
        return locationName
    }
}
