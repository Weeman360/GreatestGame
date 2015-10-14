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
    
    let game = GameController.getInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        BowlController.getInstance.setDelegate(self)
        displayNextWord()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayNextWord(){
        wordLabel.text = BowlController.getInstance.getNextWord()
    }
    
    @IBAction func NextWord(sender: AnyObject) {
        displayNextWord()
    }
}

extension WordDisplayViewController: BowlDelegate{
    func bowlIsEmpty(emptyBowl: Bowl) {
        print("Go to next Level")
        // TODO: Go to next level
    }
    
    
}