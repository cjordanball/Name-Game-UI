//
//  ContentView.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var netMan = NetworkManager()
    var body: some View {
        Text("Now is the winter of our discontent")
            .onAppear{
                    loadFunction()
                }
    }
    
    private func loadFunction() {
        print("Loading")
        netMan.fetchData()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
