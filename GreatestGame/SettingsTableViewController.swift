//
//  SettingsTableViewController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/15.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var wordsPPTextField: UITextField!
    @IBOutlet weak var secondsPRTextField: UITextField!
    @IBOutlet weak var numLevelsTextField: UITextField!
    
    var game = GameController.getInstance
    override func viewDidLoad() {
        super.viewDidLoad()

        wordsPPTextField.text = "\(game.wordsPerPlayer)"
        secondsPRTextField.text = "\(game.timePerTurn)"
        numLevelsTextField.text = "\(game.numOfLevels)"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Close(sender: AnyObject) {
        if let wpp = Int(wordsPPTextField.text!){
            game.wordsPerPlayer = wpp
        }
        
        if let spt = Int(secondsPRTextField.text!){
            game.timePerTurn = spt
        }
        
        if let nl = Int(numLevelsTextField.text!){
            game.numOfLevels = nl
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}