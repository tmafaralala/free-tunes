//
//  ExploreMusicViewModel.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/28.
//

import Foundation

class ExploreMusicViewModel {
    
    private var topTracks: [Track]?
    private weak var delegate: ViewModelDelegateType?
    private var repository: MusicRepositoryType?

    init(repository: MusicRepositoryType, delegate: ViewModelDelegateType) {
        self.repository = repository
        self.delegate = delegate
    }
    
    var numberOfTracks: Int {
        return topTracks?.count ?? 0
    }
    
    func track(atIndex: Int) -> Track? {
        return topTracks?[atIndex] ?? nil
    }
    
    func fetchMusicData() {
        repository?.fetchTrendingMusic() { [weak self] result in
            switch result {
            case .success(let musicData):
                self?.topTracks = musicData.tracksData.tracks
                self?.delegate?.reloadView()
            case .failure(let dataError):
                self?.delegate?.show(error: dataError.localizedDescription)
            }
        }
    }
    
}
