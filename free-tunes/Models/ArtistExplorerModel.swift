//
//  RecommendationsModel.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/24.
//

import Foundation

struct Artists: Codable {
    let artists: [Artist]
    enum CodingKeys: String, CodingKey {
        case artists = "data"
    }
}

struct Artist: Codable {
    let id: Int
    let name: String
    let cover: String
    let artistLink: String
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case cover = "picture_big"
        case artistLink = "link"
    }
}
