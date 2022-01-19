//
//  ContentView.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var NameGame = NameGameViewModel()
    @ObservedObject var netMan = NetworkManager()
    @State var selectedID = ""
    @State var totalScore = 0
    
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        Text("Total Points: \(totalScore)")
        VStack {
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(netMan.treeList, id: \.id) { tree in
                    ImageBlock(
                        url: stringToURLConvert(tree.headshot.url)
                    )
                        .onDrop(of: [.plainText], isTargeted: nil) { location in
                            if tree.id == selectedID {
                                totalScore += 2
                                NameGame.maskImage()
                                  
                                return true
                            }
                            return false
                        }
                }
            }
            Spacer()
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(netMan.mixedTreeList, id: \.self.id) { tree in
                    let stringConstruct: String = "\(tree.firstName) \(tree.lastName)"
                    (
                        Text(stringConstruct)
                        .frame(width: 100, height: 100,alignment: .center)
                        .background(.mint)
                        .cornerRadius(50.0)
                        .onDrag() {
                            selectedID = tree.id
                            return NSItemProvider(object: stringConstruct as NSString )
                        }
                    )
                }
            }
            Spacer()
            Button("Update") {
                Task {
                    await loadFunction()
                }
            }
        }
        .task {
            await loadFunction()
        }
        .refreshable {
            print("Refreshing!")
            await loadFunction()
        }
    }
       
    
    
    func loadFunction() async {
        do {
            let _ = try await netMan.fetchData()
        } catch {
            print("fucked up \(error)")
        }
    }
}

private func stringToURLConvert(_ urlString: String?) -> URL? {
    if let urlString = urlString {
        if let urlVal = URL(string: urlString) {
            return urlVal
        }
    }
    return nil
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 mini")
    }
}
