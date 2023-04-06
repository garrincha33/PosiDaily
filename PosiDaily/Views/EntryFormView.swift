//
//  EntryFormView.swift
//  PosiDaily
//
//  Created by Richard Price on 06/04/2023.
//

import SwiftUI

struct EntryFormView: View {
    @State private var gratitudeText = ""
    @State private var affirmationText = ""
    @State private var showAlert = false
    
    var entryStorage = EntryStorage()
    
    var body: some View {
        VStack {
            Text("What are you grateful for today?")
            TextField("Enter your gratitude", text: $gratitudeText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("What's your positive affirmation for today?")
            TextField("Enter your affirmation", text: $affirmationText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Submit") {
                let entry = Entry(id: UUID(), date: Date(), gratitude: gratitudeText, affirmation: affirmationText)
                entryStorage.save(entry: entry)
                showAlert = true
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success!"), message: Text("Your entry has been saved."), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }
}

