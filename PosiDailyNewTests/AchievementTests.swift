//
//  AchievementTests.swift
//  PosiDaily
//
//  Created by Richard Price on 25/04/2023.
//

import XCTest
@testable import PosiDaily

class AchievementTests: XCTestCase {
    func testAchievementInitialization() {
        let achievement = Achievement(id: UUID(), title: "Test Achievement", description: "This is a test achievement", isUnlocked: false)
        
        XCTAssertEqual(achievement.title, "Test Achievement")
        XCTAssertEqual(achievement.description, "This is a test achievement")
        XCTAssertEqual(achievement.isUnlocked, false)
    }
}

