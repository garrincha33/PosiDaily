//
//  AchievementsViewModel.swift
//  PosiDaily
//
//  Created by Richard Price on 08/05/2023.
//

import Foundation

class AchievementsViewModel: ObservableObject {
    @Published var achievements: [Achievement] = []

    private let achievementsStorage: AchievementsStorage

    init(achievementsStorage: AchievementsStorage) {
        self.achievementsStorage = achievementsStorage
        loadAchievements()
    }

    func loadAchievements() {
        achievements = achievementsStorage.loadAll()
    }

    func updateAchievement(achievement: Achievement) {
        achievementsStorage.update(achievement: achievement)
        loadAchievements()
    }
}

