//
//  GameDataAPIRequest.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/14/22.
//

import Foundation

let values = ReferenceValues()

enum NetworkError: Error {
    case invalidURL
    case noParse
}

class GameDataAPIRequest {
    let fetchTargetString = values.peopleDataString
    
    func fetchData() async throws -> [Tree] {
        print("Fetching")
        guard let targetURL = URL(string: fetchTargetString) else {
            throw NetworkError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: targetURL)
        
        let fullData = Array(try JSONDecoder().decode([Tree].self, from: data))
        
        let selectedItems = fullData.pickSelection(count: 4)
        
        return selectedItems
    }
}
