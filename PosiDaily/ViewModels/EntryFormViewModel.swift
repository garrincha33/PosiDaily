//
//  EntryFormViewModel.swift
//  PosiDaily
//
//  Created by Richard Price on 06/04/2023.
//

import Foundation

class EntryFormViewModel: ObservableObject {
    @Published var gratitudeText: String = ""
    @Published var affirmationText: String = ""
    @Published var showAlert: Bool = false
    
    let entryStorage: EntryStorage
    
    init(entryStorage: EntryStorage) {
        self.entryStorage = entryStorage
    }
    
    func submitEntry() {
        let entry = Entry(id: UUID(), date: Date(), gratitude: gratitudeText, affirmation: affirmationText)
        entryStorage.save(entry: entry)
        showAlert = true
        
        gratitudeText = ""
        affirmationText = ""
    }
}

