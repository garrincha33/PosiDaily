//
//  EntryDetailView.swift
//  PosiDaily
//
//  Created by Richard Price on 20/04/2023.
//

import SwiftUI

struct EntryDetailView: View {
    let entry: Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gratitude:")
                .font(.headline)
            Text(entry.gratitude)
                .padding(.bottom)
            
            Text("Affirmation:")
                .font(.headline)
            Text(entry.affirmation)
                .padding(.bottom)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Entry Details", displayMode: .inline)
    }
}

