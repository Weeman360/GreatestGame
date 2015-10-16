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
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Greatest Game"
        levelLabel.text = "Level \(game.level)"
        view.backgroundColor = Colors.colorForLevel(game.level)
        showGameStartDialog()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showGameStartDialog(){
        presentAlert("Let's Go!", message: "The game is about to start. Please give the phone to \(game.getCurrentPlayer().mName). Then press Ok to start", handler: { action in
            self.game.startGame()
            self.displayNextWord()
        })
    }
    
    func displayNextWord(){
        wordLabel.text = bowl.getNextWord()
        let current = game.getCurrentPlayer().mName
        playerNameLabel.text = current
    }
    
    func presentAlert(title: String, message: String, handler: ((UIAlertAction) -> ())?){
        let turnOverAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        turnOverAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: handler))
        self.presentViewController(turnOverAlert, animated: true, completion: nil)
    }
    
    @IBAction func NextWord(sender: AnyObject) {
        game.awardPoint()
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
        presentAlert("Time's up!", message: "Please give the phone to \(game.getCurrentPlayer().mName)", handler: { action in
            self.displayNextWord()
            self.game.startTimer()
        })
    }
    
    func levelFinished() {
        levelLabel.text = "Level \(game.level)"
        game.pauseTimer()
        presentAlert("Next level!", message: "We're going to level \(game.level) now, so remember to do level \(game.level) things. Don't worry, time has been paused", handler: { alert in
            self.game.resumeTimer()
        })
        view.backgroundColor = Colors.colorForLevel(game.level)
    }
    
    func gameFinished() {
        game.teams.printTeams()
        presentAlert("Game Over!", message: "Scores\n\(game.teams.getScrores())", handler: { action in
            self.navigationController?.popToRootViewControllerAnimated(true)
        })
    }
    
    func tickTimer(secondsLeft: Int) {
        timeLeftLabel.text = "\(secondsLeft)"
    }
}