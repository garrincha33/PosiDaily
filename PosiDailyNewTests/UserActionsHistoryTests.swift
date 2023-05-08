//
//  UserActionsHistoryTests.swift
//  PosiDailyNewTests
//
//  Created by Richard Price on 08/05/2023.
//

import XCTest
@testable import PosiDaily

class UserActionsHistoryTests: XCTestCase {
    
    func testUpdateUserActions() {
        let userActionsHistory = UserActionsHistory()
        userActionsHistory.updateUserActions(userAction: .submittedAffirmation)

        XCTAssertEqual(userActionsHistory.actionCounts[.submittedAffirmation], 1)
    }

    
    
}

enum UserAction: String {
    case submittedAffirmation
    // You can add more user actions here
}

class UserActionsHistory {
    private(set) var actionCounts: [UserAction: Int] = [:]

    func updateUserActions(userAction: UserAction) {
        if let currentCount = actionCounts[userAction] {
            actionCounts[userAction] = currentCount + 1
        } else {
            actionCounts[userAction] = 1
        }
    }
}
