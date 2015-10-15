//
//  BowlController.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

protocol BowlDelegate{
    func bowlIsEmpty(emptyBowl: Bowl)
}

class BowlController: NSObject {
    static let getInstance = BowlController()
    
    var mBowlDelegate: BowlDelegate?
    private var mBowl = Bowl(_cards: [Card]())
    private var mCompletedBowl = Bowl(_cards: [Card]())
    
    func setDelegate(controller: BowlDelegate){
        mBowlDelegate = controller
    }
    
    func setWordsInBowl(words :[String]){
        mBowl.clearCards()
        for word in words{
            let c = Card(_word: word)
            mBowl.addCard(c)
        }
        mBowl.shuffleBowl()
        mBowl.printCards()
    }
    
    func putWordBack(){
        if mCompletedBowl.cards.count > 0{
            mBowl.addCard(mCompletedBowl.cards.removeLast())
        }        
    }
    
    func getNextWord() -> String?{
        if let card = mBowl.popCard(){
            mCompletedBowl.addCard(card)
            print("cards left: \(mBowl.cards.count)")
            return card.word
        }else{
            mBowlDelegate?.bowlIsEmpty(mBowl)
            mBowl = mCompletedBowl.copyBowl()
            mCompletedBowl.clearCards()
            
            mBowl.shuffleBowl()
            mBowl.printCards()
            return getNextWord()
        }
    }
    
    
}
