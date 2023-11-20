//
//  CustomNavBar.swift
//  Navigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        NavigationStack{
            List(0..<100){ i in
                Text("Row \(i)")
            }
            .navigationTitle("Custom Title")
//            .toolbar(.hidden, for: .navigationBar)
//            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.automatic)
            .toolbarBackground(.green)
            .toolbar{
                // changing the placement of the button
                ToolbarItem(placement: .topBarLeading){
                    Button("Tap me"){
                        // do something
                    }
                }
            }
        }
    }
}

#Preview {
    CustomNavBar()
}
