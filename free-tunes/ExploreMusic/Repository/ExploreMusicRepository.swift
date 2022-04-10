//
//  ExploreMusicRepository.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/28.
//

import Foundation

typealias FetchMusicResult = (Result<TracksModel, Error>) -> Void

protocol MusicRepositoryType: AnyObject {
    func fetchTrendingMusic(completion: @escaping (FetchMusicResult))
}

class ExploreMusicRepository: MusicRepositoryType {
    func fetchTrendingMusic(completion: @escaping (FetchMusicResult)) {
        guard let url = Constants.artistExploreContentUrl else {
            DispatchQueue.main.async {
                completion(.failure(ApiError.invalidUrl))
            }
            return
        }
        URLSession.shared.makeRequest(url: url,
                                      method: .get,
                                      returnModel: TracksModel.self,
                                      completion: completion)
    }
}
