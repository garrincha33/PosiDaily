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
    
    var body: some Scene {
        WindowGroup {
            Main(entryStorage: entryStorage)
        }
    }
}

