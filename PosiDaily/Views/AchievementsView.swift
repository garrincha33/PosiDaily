//
//  AchievementsView.swift
//  PosiDaily
//
//  Created by Richard Price on 08/05/2023.
//
import SwiftUI

struct AchievementView: View {
    let achievement: Achievement

    var body: some View {
        Text(achievement.title)
    }
}
