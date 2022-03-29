//
//  ExploreMusicViewModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/28.
//

import Foundation

class ExploreMusicViewModel {
    
    private var topTracks: [Track]?
    private weak var delegate: ExploreMusicViewModelDelegate?
    private var repository: ExploreMusicRepository?

    
    init(repository: ExploreMusicRepository, delegate: ExploreMusicViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
    }
    
    var numberOfTracks: Int {
        return topTracks?.count ?? 0
    }
    
    func getTrack(atIndex: Int) -> Track? {
        return topTracks?[atIndex] ?? nil
    }
    
    func fetchMusicData() {
        repository?.fetchTrendingMusic(){ [weak self] result in
            switch result {
                case .success(let musicData):
                    self?.topTracks = musicData.tracksData.tracks
                    self?.delegate?.reloadView()
                case .failure(let dataError):
                    self?.delegate?.show(error: dataError.rawValue)
            }
        }
    }
    
}
