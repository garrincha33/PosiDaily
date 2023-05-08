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
        achievementsViewModel = AchievementsViewModel(achievementsStorage: achievementsStorage)
    }
    
    override func tearDown() {
        achievementsViewModel = nil
        achievementsStorage = nil
        super.tearDown()
    }
    
    func testSaveAndLoadAchievements() {
        let achievement = Achievement(id: UUID(), title: "Test Achievement", description: "This is a test achievement", isUnlocked: false)
        
        achievementsStorage.save(achievement: achievement)
        let loadedAchievements = achievementsStorage.loadAll()
        
        XCTAssertEqual(loadedAchievements.count, 1)
        XCTAssertEqual(loadedAchievements.first, achievement)
    }
    
    func testUpdateAchievement() {
        let achievement = Achievement(id: UUID(), title: "Test Achievement", description: "This is a test achievement", isUnlocked: false)
        achievementsStorage.save(achievement: achievement)
        
        let updatedAchievement = Achievement(id: achievement.id, title: achievement.title, description: achievement.description, isUnlocked: true)
        achievementsStorage.update(achievement: updatedAchievement)
        
        let loadedAchievements = achievementsStorage.loadAll()
        
        XCTAssertEqual(loadedAchievements.count, 1)
        XCTAssertEqual(loadedAchievements.first, updatedAchievement)
        XCTAssertTrue(loadedAchievements.first?.isUnlocked == true)
    }
}

