//
//  TimeController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/16.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class TimeController: NSObject {
    static let getInstance = TimeController()
    
    var timePassed: NSTimeInterval = 0
    var startDate: NSDate!
    
    func startTimer(){
        timePassed = 0
        startDate = NSDate()
    }
    
    func pauseTimer(){
        timePassed += NSDate().timeIntervalSinceDate(startDate)
    }
    
    func resumeTimer(){
        startDate = NSDate()
    }
    
    func stopTimer(){
        timePassed = 0
    }
    
    func getTimePassed() -> NSTimeInterval{
        let time = NSDate().timeIntervalSinceDate(startDate)
        return time + timePassed
    }
}
