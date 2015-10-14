//
//  GameController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

protocol GameControllerDelegate{
    func turnFinished(nextTeam: Team)
    func levelFinished()
}

class GameController: NSObject {
    static let getInstance = GameController()
    var gameDelegate: GameControllerDelegate?
    var teams = TeamController.getInstance
    
    let wordsPerPlayer = 5
    let numberOfPlayersPerTeam = 2
    var turn = 0
    var level = 1
       
    func nextTurn(){
        turn++
        if (turn > teams.getNumberOfTeams()-1) {
            turn = 0
            level++
            gameDelegate?.levelFinished()
        }
        gameDelegate?.turnFinished(teams.getTeamForIndex(turn))
    }
    
    func getTotalWords() -> Int{
        return teams.getNumberOfTeams() * (wordsPerPlayer * numberOfPlayersPerTeam)
    }
    
    func getCurrentPlayer() -> Person{
        return Person()
    }
}
