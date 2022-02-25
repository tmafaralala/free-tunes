//
//  ViewController.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/24.
//

import UIKit

let authManager = AuthController()

class ExploreViewController: UIViewController {

    @IBOutlet weak var albumRecommendationsCollectionView: UICollectionView!
    
    private lazy var exploreViewModel = ExploreViewModel(exploreDelegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAlbumReccomendations()
    }
    
    func setUpAlbumRecommendationCollectionView(){
        albumRecommendationsCollectionView.dataSource = self
        albumRecommendationsCollectionView.delegate = self
    }

    func getAlbumReccomendations() {
        URLSession.shared.makeRequest(url: Constants.exploreContentUrl, method: .get, returnModel: AlbumRecommendations.self){result in
            
            switch result{
            case .success(let recommended):
                self.exploreViewModel.storeAlbumsData(albums: recommended.albums)
                DispatchQueue.main.async {
                    self.setUpAlbumRecommendationCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        exploreViewModel.recommendedAlbumCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = albumRecommendationsCollectionView.dequeueReusableCell(withReuseIdentifier: "AlbumRecommendationCell", for: indexPath) as! AlbumCollectionViewCell? else {
            return UICollectionViewCell()
        }
        setupAlbumCell(url: exploreViewModel.getRecommendedAlbum(atIndex: indexPath.item).cover, cell: cell, index: indexPath.item)
        return cell
    }
    
    func setupAlbumCell(url: String, cell: AlbumCollectionViewCell, index: Int ){
        let albumCoverUrl = URL(string: url )
        cell.albumTitle.text = exploreViewModel.getRecommendedAlbum(atIndex: index).title
        cell.albumCover.loadAlbumCover(url: albumCoverUrl!)
        cell.designCell()
    }
}

extension ExploreViewController: ExploreViewModelDelegate{

}



