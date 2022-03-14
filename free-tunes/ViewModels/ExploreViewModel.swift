//
//  ExploreViewModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import Foundation

struct ExploreViewModel {
    private var topArtists: [Artist]
    init() {
        self.topArtists = []
    }
    var numberOfArtists: Int {
        return topArtists.count
    }
    func getArtist(atIndex: Int) -> Artist {
        return topArtists[atIndex]
    }
    mutating func storeArtistsData(artists: [Artist]) {
        topArtists = artists
    }
}
