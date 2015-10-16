//
//  Sounds.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/16.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit
import AudioToolbox

class Sounds: NSObject {

    static let getInstance = Sounds()
    private var correctSound: SystemSoundID = 0
    private var levelEnd: SystemSoundID = 0
    private var gameOver: SystemSoundID = 0
    private var buzzer: SystemSoundID = 0
    
    override init() {
        super.init()
        
        let correctSoundPath = NSBundle.mainBundle().pathForResource("Correct", ofType: "wav")
        let correctSoundURL = NSURL(fileURLWithPath: correctSoundPath!)
        AudioServicesCreateSystemSoundID(correctSoundURL, &correctSound)
        
        let levelEndSoundPath = NSBundle.mainBundle().pathForResource("LevelUp", ofType: "wav")
        let levelEndURL = NSURL(fileURLWithPath: levelEndSoundPath!)
        AudioServicesCreateSystemSoundID(levelEndURL, &levelEnd)
        
        let gameOverSoundPath = NSBundle.mainBundle().pathForResource("GameOver", ofType: "wav")
        let gameOverURL = NSURL(fileURLWithPath: gameOverSoundPath!)
        AudioServicesCreateSystemSoundID(gameOverURL, &gameOver)
        
        let buzzerSoundPath = NSBundle.mainBundle().pathForResource("Buzzer", ofType: "wav")
        let buzzerURL = NSURL(fileURLWithPath: buzzerSoundPath!)
        AudioServicesCreateSystemSoundID(buzzerURL, &buzzer)
        
    }
    
    func playPointAwarded(){
        AudioServicesPlaySystemSound(correctSound)
    }
    
    func playLevelEnd(){
        AudioServicesPlaySystemSound(levelEnd)
    }
    
    func playGameOver(){
        AudioServicesPlaySystemSound(gameOver)
    }
    
    func playBuzzer(){
        AudioServicesPlaySystemSound(buzzer)
    }
}
