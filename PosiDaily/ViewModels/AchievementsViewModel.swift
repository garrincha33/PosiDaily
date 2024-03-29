//
//  AchievementsViewModel.swift
//  PosiDaily
//
//  Created by Richard Price on 08/05/2023.
//

import Foundation

enum UserAction {
    case submittedAffirmation
}

class AchievementsViewModel: ObservableObject {
    
    
    @Published var achievements: [Achievement] = []
    
    private let achievementsStorage: AchievementsStorage
    private var userActionsHistory: UserActionsHistory
    
    init(achievementsStorage: AchievementsStorage, userActionsHistory: UserActionsHistory) {
        self.achievementsStorage = achievementsStorage
        self.userActionsHistory = userActionsHistory
        self.achievements = achievementsStorage.loadAll()
        loadAchievements()
    }
    
    func setupAchievements() {
        if achievementsStorage.loadAll().isEmpty {
            let firstAchievement = Achievement(id: UUID(), title: "First Affirmation", type: .firstAffirmation, description: "", isUnlocked: false)
            achievementsStorage.save(achievement: firstAchievement)
            
            let sevenDaysAchievement = Achievement(id: UUID(), title: "Seven Days Affirmations", type: .sevenDaysAffirmations, description: "", isUnlocked: false)
            achievementsStorage.save(achievement: sevenDaysAchievement)
        }
    }

    
    func loadAchievements() {
        achievements = achievementsStorage.loadAll()
    }
    
    func updateAchievement(achievement: Achievement) {
        achievementsStorage.update(achievement: achievement)
        loadAchievements()
    }
    
    func checkForAchievementsUnlock(userAction: UserAction) {
        userActionsHistory.updateUserActions(userAction: userAction)
        
        switch userAction {
        case .submittedAffirmation:
            let affirmationCount = userActionsHistory.actionCounts[.submittedAffirmation] ?? 0
            if affirmationCount == 1 {
                unlockAchievement(type: .firstAffirmation)
            } else if affirmationCount >= 7 {
                unlockAchievement(type: .sevenDaysAffirmations)
            }
        }
    }
    
    private func unlockAchievement(type: AchievementType) {
        guard let index = achievements.firstIndex(where: { $0.type == type }) else {
            return
        }
        
        var achievement = achievements[index]
        achievement.isUnlocked = true
        achievements[index] = achievement
        achievementsStorage.update(achievement: achievement)
    }
    
}
