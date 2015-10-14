//
//  AddTeamsTableViewController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/14.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class AddTeamsTableViewController: UITableViewController {

    let game = GameController.getInstance
    let teams = TeamController.getInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create at least 2 empty teams to start with
        teams.addTeam(Team(players: [Person(),Person()]))
        teams.addTeam(Team(players: [Person(),Person()]))
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.getNumberOfTeams()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AddTeamCell", forIndexPath: indexPath) as! AddTeamTableViewCell
        let team = teams.getTeamForIndex(indexPath.row)
        if team.mName == "" { team.mName = "Team \(indexPath.row + 1)" }
        cell.setupCell(team)
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            teams.removeTeam(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func AddTeam(sender: AnyObject) {
        teams.addTeam(Team(players: [Person(),Person()]))
        tableView.reloadData()
    }
    
    @IBAction func Next(sender: AnyObject) {
        teams.printTeams()
    }
}
