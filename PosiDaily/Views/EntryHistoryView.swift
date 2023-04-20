//
//  EntryHistoryView.swift
//  PosiDaily
//
//  Created by Richard Price on 20/04/2023.
//

import SwiftUI

struct EntryHistoryView: View {
    @ObservedObject var viewModel: EntryHistoryViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.entries) { entry in
                    NavigationLink(destination: EntryDetailView(entry: entry)) {
                        VStack(alignment: .leading) {
                            Text(entry.gratitude)
                                .font(.headline)
                            Text(entry.affirmation)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("History")
            .onAppear {
                viewModel.loadEntries()
            }
        }
    }
}

