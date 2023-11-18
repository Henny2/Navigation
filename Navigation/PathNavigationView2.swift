//
//  PathNavigationView2.swift
//  Navigation
//
//  Created by Henrieke Baunack on 11/17/23.
//

import SwiftUI

struct ThirdDetailView: View {
    var num: Int
    @Binding var path: NavigationPath
    var body: some View {
        NavigationLink("Go to page \(num).", value: Int.random(in: 0...100))
            .toolbar{
                Button("Home"){
                    path = NavigationPath()
                    print("test")
                }
            }
    }
}

// if i want to do the path change in the detailview, I need to add binding, works with current set up
// gotta add the binding to the details view to make this work
// otherwise we cannotchange the path from the detail view?

struct PathNavigationView2: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            ThirdDetailView(num: 0, path: $path)
                .navigationTitle("Let's navigate")
                .navigationDestination(for: Int.self) { number in
                    ThirdDetailView(num: number, path: $path)
                }
//                .toolbar{
//                    Button("Home"){
//                        path = NavigationPath()
//                        print("test")
//                    }
//                }

        }
    }
}

#Preview {
    PathNavigationView2()
}
