//
//  PathSavingView.swift
//  Navigation
//
//  Created by Henrieke Baunack on 11/17/23.
//

import SwiftUI

@Observable
class PathStore {
    var path : NavigationPath {
        didSet{
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath){
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data){
                path = NavigationPath(decoded)
                return
            }
        }
        // if we could not get the loaded path, create a new/empty one
        path = NavigationPath()
    }
    
    func save() {
        guard let encodedPath = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(encodedPath)
            try data.write(to: savePath)
        } catch {
            print("Failed to save path/navigation data.")
        }
    }
}


struct FourthDetailView: View {
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

struct PathSavingView: View {
    @State private var pathStore = PathStore()
    var body: some View {
        Text("Path saving")
        NavigationStack(path: $pathStore.path){
            ThirdDetailView(num: 0, path: $pathStore.path)
                .navigationTitle("Let's navigate")
                .navigationDestination(for: Int.self) { number in
                    ThirdDetailView(num: number, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    PathSavingView()
}
