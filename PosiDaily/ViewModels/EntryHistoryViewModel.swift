//
//  EntryHistoryViewModel.swift
//  PosiDaily
//
//  Created by Richard Price on 20/04/2023.
//

import Foundation

class EntryHistoryViewModel: ObservableObject {
    @Published var entries: [Entry] = []
    
    private let entryStorage: EntryStorage
    
    init(entryStorage: EntryStorage) {
        self.entryStorage = entryStorage
    }
    
    func loadEntries() {
        entries = entryStorage.loadAll()
    }
}

