//
//  EntryFormViewModelTests.swift
//  PosiDailyNewTests
//
//  Created by Richard Price on 06/04/2023.
//

import XCTest
@testable import PosiDaily

class EntryFormViewModelTests: XCTestCase {
    
    var entryFormViewModel: EntryFormViewModel!
    var entryStorage: EntryStorage!
    
    override func setUp() {
        super.setUp()
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        entryStorage = EntryStorage()
        entryFormViewModel = EntryFormViewModel(entryStorage: entryStorage)
    }
    
    override func tearDown() {
        entryFormViewModel = nil
        entryStorage = nil
        super.tearDown()
    }
    
    private func makeViewModel(gratitudeText: String, affirmationText: String) -> EntryFormViewModel {
        let viewModel = EntryFormViewModel(entryStorage: entryStorage)
        viewModel.gratitudeText = gratitudeText
        viewModel.affirmationText = affirmationText
        return viewModel
    }
    
    func testSubmitEntry() {
        let viewModel = makeViewModel(gratitudeText: "I am grateful for my friends", affirmationText: "I am focused and productive")
        viewModel.submitEntry()
        let savedEntries = entryStorage.loadAll()
        XCTAssertEqual(savedEntries.count, 1)
        XCTAssertEqual(savedEntries.first?.gratitude, viewModel.gratitudeText)
        XCTAssertEqual(savedEntries.first?.affirmation, viewModel.affirmationText)
        XCTAssertTrue(viewModel.showAlert)
    }
}



