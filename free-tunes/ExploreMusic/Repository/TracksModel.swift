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
    private let trackTitle: String
    private let trackArtist: Artist
    private let trackAlbum: Album
    private let previewLink: String
    enum CodingKeys: String, CodingKey {
        case trackTitle
        case trackArtist
        case trackAlbum
        case previewLink = "preview"
    }
    
    var trackLink: String {get {return previewLink}}
    var title: String {get {return trackTitle}}
    var artistName: String {get {return trackArtist.name}}
    var cover: String {get {return trackAlbum.cover}}
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
