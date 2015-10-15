//
//  WordDisplayViewController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class WordDisplayViewController: UIViewController {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    let game = GameController.getInstance
    let bowl = BowlController.getInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        bowl.setDelegate(self)
        game.gameDelegate = self
        game.startTimer()
        displayNextWord()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayNextWord(){
        wordLabel.text = bowl.getNextWord()
        let current = game.getCurrentPlayer().mName
        playerNameLabel.text = current
    }
    
    @IBAction func NextWord(sender: AnyObject) {
        displayNextWord()
    }
}

extension WordDisplayViewController: BowlDelegate{
    func bowlIsEmpty(emptyBowl: Bowl) {
        game.nextLevel()
    }
}

extension WordDisplayViewController: GameControllerDelegate{
    func turnFinished() {
        bowl.putWordBack()
        let turnOverAlert = UIAlertController(title: "Time's up!", message: "Please give the phone to \(game.getCurrentPlayer().mName)", preferredStyle: UIAlertControllerStyle.Alert)
        turnOverAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { action in
            self.displayNextWord()
            self.game.startTimer()
        }))
        self.presentViewController(turnOverAlert, animated: true, completion: nil)
    }
    
    func gameFinished() {
        
    }
    
    func tickTimer(secondsLeft: Int) {
        timeLeftLabel.text = "\(secondsLeft)"
    }
}