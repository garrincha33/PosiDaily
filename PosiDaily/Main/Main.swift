//
//  Main.swift
//  PosiDaily
//
//  Created by Richard Price on 05/04/2023.
//

import SwiftUI

struct Main: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Main!")
        }
        .padding()
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
