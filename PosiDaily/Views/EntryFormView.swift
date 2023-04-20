//
//  EntryFormView.swift
//  PosiDaily
//
//  Created by Richard Price on 06/04/2023.
//

import SwiftUI

struct EntryFormView: View {
    
    @ObservedObject var viewModel: EntryFormViewModel

    var body: some View {
        VStack {
            Text("What are you grateful for today?")
            TextField("Enter your gratitude", text: $viewModel.gratitudeText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("What's your positive affirmation for today?")
            TextField("Enter your affirmation", text: $viewModel.affirmationText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Submit") {
                viewModel.submitEntry()
            }
            .padding()
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Success!"), message: Text("Your entry has been saved."), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }
}
