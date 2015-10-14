//
//  TeamController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/14.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class TeamController: NSObject {
    
    static let getInstance = TeamController()
    private var teams = [Team]()
    
    func addTeam(team: Team){
        teams.append(team)
    }
    
    func removeTeam(index: Int){
        teams.removeAtIndex(index)
    }
    
    func getTeamForIndex(index: Int) -> Team{
        return teams[index]
    }
        
    func getNumberOfTeams() -> Int{
        return teams.count
    }
    
    func printTeams(){
        for team in teams{
            print("Team: \(team.mName)")
            print("------------------------------")
            for player in team.mPlayers {
                print(player.mName)
            }
            print("------------------------------")
        }
    }

}

