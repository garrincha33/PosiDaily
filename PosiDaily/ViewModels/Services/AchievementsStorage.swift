//
//  AchievementsStorage.swift
//  PosiDaily
//
//  Created by Richard Price on 08/05/2023.
//


import Foundation

struct AchievementsStorage {
    private let achievementsKey = "achievements"

    func save(achievement: Achievement) {
        var achievements = loadAll()
        achievements.append(achievement)
        saveAll(achievements: achievements)
    }

    func loadAll() -> [Achievement] {
        if let data = UserDefaults.standard.data(forKey: achievementsKey),
           let achievements = try? JSONDecoder().decode([Achievement].self, from: data) {
            return achievements
        }
        return []
    }

    func update(achievement: Achievement) {
        var achievements = loadAll()
        if let index = achievements.firstIndex(where: { $0.id == achievement.id }) {
            achievements[index] = achievement
            saveAll(achievements: achievements)
        }
    }
    
    func reset() {
           UserDefaults.standard.removeObject(forKey: achievementsKey)
       }

    private func saveAll(achievements: [Achievement]) {
        if let data = try? JSONEncoder().encode(achievements) {
            UserDefaults.standard.set(data, forKey: achievementsKey)
        }
    }
}
