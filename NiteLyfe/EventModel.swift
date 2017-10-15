//
//  EventModel.swift
//  NiteLyfeApp
//
//  Created by Shannon, Leandre D. (MU-Student) on 10/14/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import Foundation

class EventModel: NSObject {
    //properties
    var title: String
    var datetime: String
    var desc: String
    var location: String
    
    //empty contructor
    
    override init() {
        
    }
    
    //constructor with @location_id, @title, @datetime, @desc, @profile_email
    init(title: String, datetime: String, desc: String, location: String ) {
        self.title = title
        self.datetime = datetime
        self.desc = desc
        self.location = location
    }
}
