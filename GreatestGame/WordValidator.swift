//
//  WordValidator.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class WordValidator: NSObject {

    static func validate(wordToAdd: String, words: [String]) -> Bool{
        for word in words {
            // If word is not unique
            if wordToAdd == word { return false }
        }
        
        // If word is empty string
        if wordToAdd.isEmpty { return false }
        
        return true
    }
}
