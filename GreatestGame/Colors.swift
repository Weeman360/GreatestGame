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
            return UIColor(netHex: 0x66CCFF)
        case 2:
            return UIColor(netHex: 0x99FF99)
        case 3:
            return UIColor(netHex: 0xFF6666)
        default:
            return UIColor.whiteColor()
        }
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}