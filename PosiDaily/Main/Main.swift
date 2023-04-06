//
//  Main.swift
//  PosiDaily
//
//  Created by Richard Price on 05/04/2023.
//

import SwiftUI

struct Main: View {
    private var entryStorage = EntryStorage()
    
    init(entryStorage: EntryStorage) {
            self.entryStorage = entryStorage
        }
    
    var body: some View {
        TabView {
            EntryFormView(viewModel: EntryFormViewModel(entryStorage: entryStorage))
                .tabItem {
                    Label("New Entry", systemImage: "plus")
                }
            
//            EntryHistoryView(viewModel: EntryHistoryViewModel(entryStorage: entryStorage))
//                .tabItem {
//                    Label("History", systemImage: "clock")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Main(entryStorage: EntryStorage())
    }
}
