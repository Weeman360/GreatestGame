//
//  GameController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

protocol GameControllerDelegate{
    func tickTimer(secondsLeft: Int)
    func turnFinished()
    func levelFinished()
    func gameFinished()
}

class GameController: NSObject {
    static let getInstance = GameController()
    var gameDelegate: GameControllerDelegate?
    var teams = TeamController.getInstance
    
    var time = NSDate()
    var ticker: NSTimer!
    let wordsPerPlayer = 5
    let numberOfPlayersPerTeam = 2
    let numOfLevels = 3
    let timePerTurn = 30
    var turn = 0
    var level = 1
    
    func nextTurn(){
        turn++
        if (turn > teams.getNumberOfTeams()-1) {
            turn = 0
        }
        teams.getTeamForIndex(turn).nextPlayer()
        gameDelegate?.turnFinished()
    }
    
    func nextLevel(){
        level++
        if level > numOfLevels {
            stopTimer()
            gameDelegate?.gameFinished()
        }else{
            gameDelegate?.levelFinished()
        }
    }
    
    func getTotalWords() -> Int{
        return teams.getNumberOfTeams() * (wordsPerPlayer * numberOfPlayersPerTeam)
    }
    
    func getCurrentPlayer() -> Person{
        let currentTeam = teams.getTeamForIndex(turn)
        return currentTeam.getActivePlayer()
    }
    
    func awardPoint(){
        let currentTeam = teams.getTeamForIndex(turn)
        currentTeam.addPoint()
    }
    
    // MARK: - Timer
    func startTimer(){
        ticker = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("tickTimer"), userInfo: nil, repeats: true)
        time = NSDate()
    }
    
    func pauseTimer(){
        
    }
    
    func resumeTimer(){
        
    }
    
    func tickTimer(){
        // Time passed in seconds
        let timePassed = Int(NSDate().timeIntervalSinceDate(time))
        let secondsLeft = timePerTurn - timePassed        
        if secondsLeft <= 0 {
            stopTimer()
            nextTurn()
        }
        gameDelegate?.tickTimer(secondsLeft)
    }
    
    func stopTimer(){
        ticker.invalidate()
    }
    
}
