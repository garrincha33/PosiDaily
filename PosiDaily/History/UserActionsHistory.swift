//
//  UserActionsHistory.swift
//  PosiDaily
//
//  Created by Richard Price on 08/05/2023.
//


struct UserActionsHistory {
    private(set) var actionCounts: [UserAction: Int] = [:]
    
    mutating func updateUserActions(userAction: UserAction) {
        if let currentCount = actionCounts[userAction] {
            actionCounts[userAction] = currentCount + 1
        } else {
            actionCounts[userAction] = 1
        }
    }
    
    mutating func getConsecutiveDays(action: UserAction) -> Int {
           
        return 0
       }
}

