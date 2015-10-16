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
    let teams = TeamController.getInstance
    let timer = TimeController.getInstance
    let sounds = Sounds.getInstance
    
    var ticker: NSTimer!
    var wordsPerPlayer = 5
    let numberOfPlayersPerTeam = 2
    var numOfLevels = 3
    var timePerTurn = 30
    var turn = 0
    var level = 1
    
    func startGame(){
        startTimer()
    }
    
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
            sounds.playGameOver()
        }else{
            gameDelegate?.levelFinished()
            sounds.playLevelEnd()
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
        sounds.playPointAwarded()
    }
    
    // MARK: - Timer
    func startTimer(){
        ticker = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("tickTimer"), userInfo: nil, repeats: true)
        timer.startTimer()
    }
    
    func pauseTimer(){
        timer.pauseTimer()
        ticker.invalidate()
    }
    
    func resumeTimer(){
        ticker = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("tickTimer"), userInfo: nil, repeats: true)
        timer.resumeTimer()
    }
    
    func tickTimer(){
        // Time passed in seconds
        let timePassed = Int(timer.getTimePassed())
        let secondsLeft = timePerTurn - timePassed        
        if secondsLeft <= 0 {
            stopTimer()
            nextTurn()
        }
        gameDelegate?.tickTimer(secondsLeft)
    }
    
    func stopTimer(){
        timer.stopTimer()
        ticker.invalidate()
    }
    
}
