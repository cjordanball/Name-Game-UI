//
//  NetworkManager.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/11/22.
//

import Foundation
import SwiftUI

let values = ReferenceValues()

class NetworkManager: ObservableObject {
    let fetchTargetString = values.peopleDataString
    
    func fetchData() {
        print("inFetch")
        let targetURL: URL? = URL(string: fetchTargetString)
        if let targetURL = targetURL {
            print("target: \(targetURL)")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: targetURL) { data, res, err in
                if let err = err {
                    print("We got an error: \(err)")
                }
                if let data = data {
                    let dataString: String? = String(data: data, encoding: .utf8)
                    if let dataString = dataString {
                        print("big Data: \(dataString)")
                    }
                }
            }
            task.resume()
        }
    }

}
