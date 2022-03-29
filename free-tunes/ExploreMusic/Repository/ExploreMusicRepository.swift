//
//  ExploreMusicRepository.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/28.
//

import Foundation

class ExploreMusicRepository {
    func fetchTrendingMusic(completion: @escaping ((FetchMusicResult) -> Void)) {
        guard let url = Constants.artistExploreContentUrl else {
            DispatchQueue.main.async {
                completion(.failure(ApiError.invalidUrl))
            }
            return
        }
        URLSession.shared.makeRequest(url: url, method: .get, returnModel: TracksModel.self, completion: completion)
    }
}
