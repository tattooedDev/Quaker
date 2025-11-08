//
//  Item.swift
//  Quaker
//
//  Created by Dennis Parussini on 08.11.25.
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
