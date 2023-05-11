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
        var userActionsHistory = UserActionsHistory()
        userActionsHistory.updateUserActions(userAction: .submittedAffirmation)
        
        XCTAssertEqual(userActionsHistory.actionCounts[.submittedAffirmation], 1)
    }
}
