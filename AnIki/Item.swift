//
//  Item.swift
//  AnIki
//
//  Created by Timur Baiazitov on 30.12.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
