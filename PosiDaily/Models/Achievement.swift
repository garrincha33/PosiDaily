//
//  Achievement.swift
//  PosiDaily
//
//  Created by Richard Price on 25/04/2023.
//

import Foundation

struct Achievement: Codable, Identifiable, Equatable {
    let id: UUID
    let title: String
    let description: String
    let isUnlocked: Bool
}
