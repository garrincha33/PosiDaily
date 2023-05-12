//
//  PosiDailyApp.swift
//  PosiDaily
//
//  Created by Richard Price on 05/04/2023.
//

import SwiftUI

@main
struct PosiDailyApp: App {
    private let entryStorage = EntryStorage()
    let achievementsStorage = AchievementsStorage()
    let userActionsHistory = UserActionsHistory()
    let viewModel: AchievementsViewModel

    init() {
        self.viewModel = AchievementsViewModel(achievementsStorage: achievementsStorage, userActionsHistory: userActionsHistory)
    }
    
    var body: some Scene {
        WindowGroup {
            Main(entryStorage: entryStorage)
                .onAppear(perform: viewModel.setupAchievements)
        }
    }
}
