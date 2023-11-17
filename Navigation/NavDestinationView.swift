//
//  ContentView.swift
//  Navigation
//
//  Created by Henrieke Baunack on 11/15/23.
//

import SwiftUI


struct DetailView: View {
    var body: some View {
        NavigationLink("Press here", value: "hi")
            
    }
}

struct NavDestinationView: View {
    var body: some View {
        NavigationStack{
            DetailView()
                .navigationDestination(for: String.self) { selection in
                    Text("Hi \(selection)")
            }
        }
    }
}

#Preview {
    NavDestinationView()
}
