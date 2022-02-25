//
//  ExploreViewModel.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import Foundation

protocol ExploreViewModelDelegate: AnyObject{
  
}

struct ExploreViewModel{
    
    private var recommendedAlbums: [Album]
    private weak var exploreDelegate: ExploreViewModelDelegate?
    
    init( exploreDelegate: ExploreViewModelDelegate?){
        self.recommendedAlbums = []
        self.exploreDelegate = exploreDelegate
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


