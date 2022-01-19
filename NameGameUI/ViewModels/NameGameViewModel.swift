//
//  NameGameViewModel.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/12/22.
//
//import SwiftUI
//import Combine
//
//let values = ReferenceValues()
//
//class NameGameViewModel: ObservableObject {
//    let 
//    // MARK: - Intents
//    func maskImage() {
//        values.
//        print("Masking the image!")
//    }
//}
//
//
//enum NetworkError: Error {
//    case invalidURL
//    case noParse
//}
//
//class NetworkManager: ObservableObject {
//    @Published var treeList = [Tree]()
//    @Published var mixedTreeList = [Tree]()
//    let fetchTargetString = values.peopleDataString
//    
//    func fetchData() async throws {
//        print("Fetching")
//        guard let targetURL = URL(string: fetchTargetString) else {
//            throw NetworkError.invalidURL
//        }
//        let (data, _) = try await URLSession.shared.data(from: targetURL)
//        
//        let fullData = Array(try JSONDecoder().decode([Tree].self, from: data))
//        
//        let selectedItems = fullData.pickSelection(count: 4)
//        
//        DispatchQueue.main.async {
//            self.treeList = selectedItems
//            self.mixedTreeList = selectedItems.shuffled()
//        }
//    }
//}
