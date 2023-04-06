//
//  Entry.swift
//  PosiDaily
//
//  Created by Richard Price on 06/04/2023.
//

import Foundation

struct Entry: Identifiable, Codable, Equatable {
    let id: UUID
    let date: Date
    let gratitude: String
    let affirmation: String
}
