//
//  RecommendationsModel.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/24.
//

import Foundation

struct AlbumRecommendations: Codable{
    
    let albums: [Album]
    
    enum CodingKeys: String, CodingKey{
        case albums = "data"
    }c
}

struct Album: Codable{
    let id: Int
    let title: String
    let cover: String
}
