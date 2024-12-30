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
    var isDefault: Bool
    var name: String
    var createdAt: Date
    var updatedAt: Date
    
    @Relationship(deleteRule: .cascade, inverse: \Card.deck)
    var cards: [Card]
    
    init(isDefault: Bool, name: String, createdAt: Date, updatedAt: Date, cards: [Card]) {
        self.isDefault = isDefault
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.cards = cards
    }
}

