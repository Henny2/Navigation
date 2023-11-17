//
//  PathNavigationView.swift
//  Navigation
//
//  Created by Henrieke Baunack on 11/16/23.
//

import SwiftUI

struct SecondDetailView: View {
    var num: Int
    var body: some View {
        NavigationLink("Go to page \(num).", value: Int.random(in: 0...100))
    }
}

// if i want to do the path change in the detailview, I need to add binding, works with current set up
// gotta add the binding to the details view to make this work
// otherwise we cannotchange the path from the detail view?

struct PathNavigationView: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            SecondDetailView(num: 0)
                .navigationTitle("Let's navigate")
                .navigationDestination(for: Int.self) { number in
                    SecondDetailView(num: number)
                        .toolbar{
                            Button("Home"){
                                path = NavigationPath()
                                print("test")
                            }
                        }
                }
                .toolbar{
                    Button("Home"){
                        path = NavigationPath()
                        print("test")
                    }
                }

        }
            }
}


#Preview {
    PathNavigationView()
}
