//
//  EntryHistoryViewModelTests.swift
//  PosiDailyNewTests
//
//  Created by Richard Price on 20/04/2023.
//

import XCTest
@testable import PosiDaily

class EntryHistoryViewModelTests: XCTestCase {
    
    var entryHistoryViewModel: EntryHistoryViewModel!
    var entryStorage: EntryStorage!
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        entryStorage = EntryStorage()
        entryHistoryViewModel = EntryHistoryViewModel(entryStorage: entryStorage)
    }
    
    override func tearDown() {
        entryHistoryViewModel = nil
        entryStorage = nil
        super.tearDown()
    }
    
    func testLoadEntries() {
        let entryStorage = EntryStorage()
        let entry = Entry(id: UUID(), date: Date(), gratitude: "I am grateful for my health", affirmation: "I am capable of achieving my goals")
        entryStorage.save(entry: entry)
        
        let viewModel = EntryHistoryViewModel(entryStorage: entryStorage)
        viewModel.loadEntries()
        
        XCTAssertEqual(viewModel.entries.count, 1)
        XCTAssertEqual(viewModel.entries.first, entry)
    }
    
    
    
}
