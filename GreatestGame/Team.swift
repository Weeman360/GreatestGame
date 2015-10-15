//
//  Team.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class Team: NSObject {
    var mPlayers: [Person]!
    var mName: String!
    var mColor: UIColor!
    var mActivePlayer: Int = 0
    var score = 0
    
    
    init(players: [Person]) {
        mPlayers = players
        mName = ""
    }
    
    init(players: [Person], name: String) {
        mPlayers = players
        mName = name
    }
    
    func updatePlayerName(index: Int, newName: String){
        mPlayers[index].mName = newName
    }
    
    func addPoint(){
        score++;
    }
    
    func getScore() -> Int{
        return score
    }
    
    func nextPlayer(){
        mActivePlayer++;
        if mActivePlayer > 1 { mActivePlayer = 0}
    }
    
    func getActivePlayer() -> Person{
        return mPlayers[mActivePlayer]
    }
}
