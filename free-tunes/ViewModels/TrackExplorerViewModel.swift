//
//  ExploreViewModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import Foundation

struct TrackExplorerViewModel {
    
    private var topTracks: [Track]
    
    init() {
        self.topTracks = []
    }
    
    var numberOfTracks: Int {
        return topTracks.count
    }
    
    func getTrack(atIndex: Int) -> Track {
        return topTracks[atIndex]
    }
    
    mutating func storeTracksData(tracks: [Track]) {
        topTracks = tracks
    }
}
