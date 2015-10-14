//
//  Bowl.swift
//  GreatestGame
//
//  Created by Pienaar Anker on 2015/10/13.
//  Copyright © 2015 Pienaar Anker. All rights reserved.
//

import UIKit

class Bowl: NSObject {
    var cards = [Card]()
    
    init(_cards: [Card]) {
        cards = _cards
    }

    func addCard(c: Card){
        cards.append(c)
    }
    
    func removeCard(atIndex: Int){
        cards.removeAtIndex(atIndex)
    }
    
    func clearCards(){
        cards.removeAll()
    }
    
    func popCard() -> Card?{
        var card: Card?
        if !cards.isEmpty {
            card = cards.first
            removeCard(0)
        }
        return card
    }
    
    func shuffleBowl(){
        cards.shuffleInPlace()
    }
    
    func copyBowl() -> Bowl {
        let bowl = Bowl(_cards: [Card]())
        for card in cards{
            bowl.addCard(card)
        }
        return bowl
    }
    
    func printCards(){
        print("Cards\n-------------")
        for card in cards{
            print(card.word)
        }
    }
}

extension CollectionType where Index == Int {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
