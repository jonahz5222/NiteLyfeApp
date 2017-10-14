//
//  pinAnnotation.swift
//  NiteLyfeApp
//
//  Created by Ochirnyam's Mac on 10/14/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import MapKit

class pinAnnotation: NSObject, MKAnnotation{
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String,subtitle:String, coordinate:CLLocationCoordinate2D){
        self.title=title
        self.subtitle=subtitle
        self.coordinate=coordinate
    }
}
