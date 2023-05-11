//
//  Achievement.swift
//  PosiDaily
//
//  Created by Richard Price on 25/04/2023.
//

import Foundation

enum AchievementType: String, Codable, CaseIterable {
    case firstAffirmation
    case sevenDaysAffirmations
    
    var description: String {
        switch self {
        case .firstAffirmation:
            return "First Affirmation Submitted!"
        case .sevenDaysAffirmations:
            return "Seven Days of Affirmations!"
        }
    }
}

struct Achievement: Codable, Identifiable, Equatable {
    let id: UUID
    let title: String
    let type: AchievementType
    let description: String
    var isUnlocked: Bool

    static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        return lhs.id == rhs.id // Or whatever equality condition fits your needs
    }
}
