//
//  EntryStorage.swift
//  PosiDaily
//
//  Created by Richard Price on 06/04/2023.
//

import Foundation

struct EntryStorage {
    private let userDefaults = UserDefaults.standard
    private let storageKey = "entries"
    
    func save(entry: Entry) {
        var entries = loadAll()
        entries.append(entry)
        if let endcoded = try? JSONEncoder().encode(entries) {
            userDefaults.set(endcoded, forKey: storageKey)
        }
    }
    
    func loadAll() -> [Entry] {
        if let data = userDefaults.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Entry].self, from: data) {
            return decoded
        } else {
            return []
        }
    }
}
