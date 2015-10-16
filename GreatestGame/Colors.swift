//
//  Colors.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/16.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class Colors: NSObject {
    
    static func colorForLevel(level: Int) -> UIColor{
        switch level{
        case 1:
            return UIColor.blueColor()
        case 2:
            return UIColor.greenColor()
        case 3:
            return UIColor.redColor()
        default:
            return UIColor.whiteColor()
        }
    }
    
}
