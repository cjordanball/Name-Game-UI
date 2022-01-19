//
//  ImageBlock.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/12/22.
//

import SwiftUI

struct ImageBlock: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
           switch phase {
           case .empty:
               ProgressView()
           case .success(let image):
               image.resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(maxWidth: 300, maxHeight: 300)
           case .failure:
               Image(systemName: "photo")
           @unknown default:
               Text("No image")
           }
       }
    }
}
            
