//
//  AchievementsListView.swift
//  PosiDaily
//
//  Created by Richard Price on 12/05/2023.
//

import SwiftUI

struct AchievementsListView: View {
    @ObservedObject var viewModel: AchievementsViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.achievements) { achievement in
                    AchievementView(achievement: achievement)
                }
            }
            .navigationTitle("Achievements")
        }
        .onAppear {
            viewModel.loadAchievements()
        }
    }
}


