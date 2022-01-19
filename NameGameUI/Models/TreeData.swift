//
//  TreeData.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/11/22.
//

import Foundation

struct TreeData: Codable {
    let forest: [Tree]
}

struct HeadShot: Codable, Hashable {
    let alt: String
    let height: Int?
    let id: String
    let mimeType: String?
    let type: String
    let url: String?
    let width: Int?
}
//
//struct SocialLink: Codable {
//    let callToAction: String
//    let type: String
//    let url: String
//}

struct Tree: Codable, Hashable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let slug: String
    var jobTitle: String?
    let headshot: HeadShot
    var chosen: Bool?
    mutating func markChosen() -> Void {
        self.chosen = true
    }
}
