//
//  AchievementStorageTests.swift
//  PosiDailyNewTests
//
//  Created by Richard Price on 08/05/2023.
//

import XCTest
@testable import PosiDaily

class AchievementsStorageTests: XCTestCase {
    var achievementsViewModel: AchievementsViewModel!
    var achievementsStorage: AchievementsStorage!
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        achievementsStorage = AchievementsStorage()
        achievementsStorage.reset()
        achievementsViewModel = AchievementsViewModel(achievementsStorage: achievementsStorage, userActionsHistory: UserActionsHistory())
    }

    
    override func tearDown() {
        achievementsViewModel = nil
        achievementsStorage = nil
        super.tearDown()
    }
    
    func testSaveAndLoadAchievements() {
        let initialAchievementsCount = achievementsViewModel.achievements.count

        let newAchievement = Achievement(id: UUID(), title: "Test Achievement", type: AchievementType.firstAffirmation, description: "This is a test achievement", isUnlocked: false)
        achievementsStorage.save(achievement: newAchievement)

        let loadedAchievements = achievementsStorage.loadAll()
        XCTAssertEqual(loadedAchievements.count, initialAchievementsCount + 1)
        XCTAssertEqual(loadedAchievements.last, newAchievement)
    }

    
    func testUpdateAchievement() {
        let initialAchievement = Achievement(id: UUID(), title: "Test Achievement", type: AchievementType.firstAffirmation, description: "This is a test achievement", isUnlocked: false)
        achievementsStorage.save(achievement: initialAchievement)
        
        let updatedAchievement = Achievement(id: initialAchievement.id, title: initialAchievement.title, type: AchievementType.firstAffirmation, description: initialAchievement.description, isUnlocked: true)
        achievementsStorage.update(achievement: updatedAchievement)
        
        let loadedAchievements = achievementsStorage.loadAll()
        
        XCTAssertEqual(loadedAchievements.count, 1)
        XCTAssertEqual(loadedAchievements.first?.id, updatedAchievement.id)
        XCTAssertEqual(loadedAchievements.first?.isUnlocked, updatedAchievement.isUnlocked)
    }

}
