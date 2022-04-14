//
//  RecommendationsModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/24.
//

import Foundation

struct TracksModel: Codable {
    let tracksData: Tracks
    enum CodingKeys: String, CodingKey {
        case tracksData = "tracks"
    }
}

struct Tracks: Codable {
    let tracks: [Track]
    enum CodingKeys: String, CodingKey {
        case tracks = "data"
    }
}

struct Track: Codable {
    let title: String
    let artist: Artist
    let trackAlbum: Album
    let trackLink: String
    enum CodingKeys: String, CodingKey {
        case title
        case artist
        case trackAlbum
        case trackLink = "preview"
    }
}

struct Album: Codable {
    let cover: String
    enum CodingKeys: String, CodingKey {
        case cover = "cover_big"
    }
}

struct Artist: Codable {
    let name: String
}
