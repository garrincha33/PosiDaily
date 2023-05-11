//
//  AchievementsView.swift
//  PosiDaily
//
//  Created by Richard Price on 08/05/2023.
//
import SwiftUI

struct AchievementsView: View {
    @ObservedObject var viewModel: AchievementsViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.achievements) { achievement in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(achievement.title)
                                .font(.headline)
                            Text(achievement.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .lineLimit(2)
                        }
                        Spacer()
                        Image(systemName: achievement.isUnlocked ? "checkmark.circle.fill" : "lock.circle")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(achievement.isUnlocked ? .green : .gray)
                            .onTapGesture {
                                viewModel.updateAchievement(achievement: achievement)
                            }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationBarTitle("Achievements")
            .onAppear {
                viewModel.loadAchievements()
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(viewModel: AchievementsViewModel(achievementsStorage: AchievementsStorage(), userActionsHistory: UserActionsHistory()))
    }
}

