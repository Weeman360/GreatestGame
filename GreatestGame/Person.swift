//
//  Person.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class Person: NSObject {
    var mName: String!
    
    override init(){
        super.init()
        mName = ""
    }
    
    init(name: String) {
        mName = name
    }
}
