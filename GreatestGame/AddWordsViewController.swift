//
//  AddWordsViewController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class AddWordsViewController: UIViewController {

    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var wordsLeftLabel: UILabel!
    @IBOutlet weak var totalWordsLabel: UILabel!
    
    let game = GameController.getInstance
    let teams = TeamController.getInstance
    var wordsArr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Add Words"
        // Do any additional setup after loading the view.
        updateWordsLeftText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWordsLeftText(){
        let wordsPerTeam = (game.wordsPerPlayer * game.numberOfPlayersPerTeam)
        let teamIndex = wordsArr.count / wordsPerTeam
        let wordsLeft = game.wordsPerPlayer - (wordsArr.count % game.wordsPerPlayer)
        let playerIndex = (wordsArr.count - (wordsPerTeam * teamIndex)) / game.wordsPerPlayer
        let person = teams.getTeamForIndex(teamIndex).mPlayers[playerIndex]
        wordsLeftLabel.text = "\(person.mName) needs to add \(wordsLeft) more words"
        totalWordsLabel.text = "\(wordsArr.count) / \(game.getTotalWords()) words added"
        
        if (wordsLeft == game.wordsPerPlayer && wordsArr.count > 0) { showNextPlayerAlert(person.mName) }
    }
    
    func showNextPlayerAlert(nextPlayerName: String){
        let alert = UIAlertController(title: "Next Player", message: "All done, please let \(nextPlayerName) add his/her words", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func AddWord(sender: AnyObject) {
        if let word = wordTextField.text {
            if WordValidator.validate(word, words: wordsArr){
                wordsArr.append(word)
                wordTextField.text = ""
                wordsArr.count == game.getTotalWords() ? StartGame("") : updateWordsLeftText()
            }
        }
    }

    @IBAction func TextChanged(sender: AnyObject) {
        addButton.enabled = wordTextField.hasText()
    }
    
    @IBAction func StartGame(sender: AnyObject) {
        BowlController.getInstance.setWordsInBowl(wordsArr)
        performSegueWithIdentifier("startGame", sender: nil)
    }
}
