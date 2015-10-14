//
//  AddTeamTableViewCell.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/14.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit


class AddTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var player1TextField: UITextField!
    @IBOutlet weak var player2TextField: UITextField!
    
    var team: Team!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(t: Team){
        team = t
        player1TextField.text = team.mPlayers[0].mName
        player2TextField.text = team.mPlayers[1].mName
        teamNameLabel.text = team.mName
    }

    @IBAction func PlayerNameChanged(sender: UITextField) {
        team.updatePlayerName(sender.tag, newName: sender.text!)
        team.mName = "\(team.mPlayers[0].mName) & \(team.mPlayers[1].mName)"
        teamNameLabel.text = team.mName
    }

}
