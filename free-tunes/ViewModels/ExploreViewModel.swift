//
//  ExploreViewModel.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import Foundation

struct ExploreViewModel{
    
    private var recommendedAlbums: [Album]
    
    init(){
        self.recommendedAlbums = []
    }
    
    var recommendedAlbumCount: Int {
        return recommendedAlbums.count
    }
    
    func getRecommendedAlbum(atIndex: Int) -> Album {
        return recommendedAlbums[atIndex]
    }
    
    mutating func storeAlbumsData(albums: [Album]){
        recommendedAlbums = albums
    }
}


