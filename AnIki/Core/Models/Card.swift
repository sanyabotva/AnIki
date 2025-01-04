//
//  Card.swift
//  AnIki
//
//  Created by Timur Baiazitov on 30.12.2024.
//

import Foundation
import SwiftData

@Model
final class Card {
    var front: String
    var back: String
    var createdAt: Date
    var updatedAt: Date
    var repeatAt: Date
    var timesAnsweredEasy: Int
    
    var deck: Deck?
    
    init(front: String, back: String, createdAt: Date, updatedAt: Date, repeatAt: Date, timesAnsweredEasy: Int, deck: Deck?) {
        self.front = front
        self.back = back
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.repeatAt = repeatAt
        self.timesAnsweredEasy = timesAnsweredEasy
        self.deck = deck
    }
}

