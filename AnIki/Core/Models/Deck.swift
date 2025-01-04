//
//  Deck.swift
//  AnIki
//
//  Created by Timur Baiazitov on 30.12.2024.
//

import Foundation
import SwiftData

@Model
final class Deck {
    var name: String
    var isDefault: Bool
    var createdAt: Date
    var updatedAt: Date
    var feedSize: Int
    
    @Relationship(deleteRule: .cascade, inverse: \Card.deck)
    var cards: [Card]
    
    init(name: String, isDefault: Bool, createdAt: Date, updatedAt: Date, feedSize: Int, cards: [Card]) {
        self.name = name
        self.isDefault = isDefault
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.feedSize = feedSize
        self.cards = cards
    }
}

