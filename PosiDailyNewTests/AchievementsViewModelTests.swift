//
//  AchievementsViewModelTests.swift
//  PosiDailyNewTests
//
//  Created by Richard Price on 08/05/2023.
//

import XCTest
@testable import PosiDaily

class AchievementsViewModelTests: XCTestCase {
    
    func testCheckForAchievementsUnlock() {
        let userActionsHistory = UserActionsHistory()
        let achievementsStorage = AchievementsStorage()

        let firstAchievement = Achievement(id: UUID(), title: "First Affirmation", type: .firstAffirmation, description: "", isUnlocked: false)
        achievementsStorage.save(achievement: firstAchievement)
        
        let sevenDaysAchievement = Achievement(id: UUID(), title: "Seven Days Affirmations", type: .sevenDaysAffirmations, description: "", isUnlocked: false)
        achievementsStorage.save(achievement: sevenDaysAchievement)
        
        let achievementsViewModel = AchievementsViewModel(achievementsStorage: achievementsStorage, userActionsHistory: userActionsHistory)
    
        achievementsViewModel.checkForAchievementsUnlock(userAction: .submittedAffirmation)
        let firstAchievementUnlocked = achievementsViewModel.achievements.first(where: { $0.type == .firstAffirmation })
        XCTAssertTrue(firstAchievementUnlocked?.isUnlocked == true)
        for _ in 1...6 {
            achievementsViewModel.checkForAchievementsUnlock(userAction: .submittedAffirmation)
        }
        let sevenDaysAchievementUnlocked = achievementsViewModel.achievements.first(where: { $0.type == .sevenDaysAffirmations })
        XCTAssertTrue(sevenDaysAchievementUnlocked?.isUnlocked == true)
    }
}
