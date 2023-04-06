//
//  EntryStorageTests.swift
//  PosiDailyNewTests
//
//  Created by Richard Price on 06/04/2023.
//

import XCTest
@testable import PosiDaily

final class EntryStorageTests: XCTestCase {
    
    var entryStorage: EntryStorage!
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        entryStorage = EntryStorage()
    }
    
    override func tearDown() {
        entryStorage = nil
        super.tearDown()
    }
    
    func testSaveAndLoadEntries() {
        let fixedUUID = UUID()
        let fixedDate = Date(timeIntervalSince1970: 1_000_000)
        let entry = Entry(id: fixedUUID, date: fixedDate, gratitude: "I am grateful for my family", affirmation: "I am confident and strong")
        
        entryStorage.save(entry: entry)
        let loadedEntries = entryStorage.loadAll()
        
        XCTAssertEqual(loadedEntries.count, 1)
        XCTAssertEqual(loadedEntries.first, entry)
    } 
}

