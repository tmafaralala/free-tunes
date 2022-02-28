//
//  ViewController.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/24.
//

import UIKit

let authManager = AuthController()

class ExploreViewController: UIViewController {

    @IBOutlet weak var exploreCollectionView: UICollectionView!
    private lazy var exploreViewModel = ExploreViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpExploreCollectionView()
    }
    func setUpExploreCollectionView() {
        exploreCollectionView.dataSource = self
        exploreCollectionView.delegate = self
    }

    func getExploreViewContent() {
        let url = Constants.exploreContentUrl
        URLSession.shared.makeRequest(url: url, method: .get, returnModel: AlbumRecommendations.self) { result in
            switch result {
            case .success(let recommended):
                self.exploreViewModel.storeAlbumsData(albums: recommended.albums)
                DispatchQueue.main.async {
                    self.setUpExploreCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        exploreViewModel.recommendedAlbumCount
        5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = exploreCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
                as UICollectionViewCell?
        else {
            return UICollectionViewCell()
        }
//        setupAlbumCell(url: exploreViewModel.getRecommendedAlbum(atIndex: indexPath.item).cover, cell: cell,
//            index: indexPath.item)
        return cell
    }
    func setupAlbumCell(url: String, cell: AlbumCollectionViewCell, index: Int ) {
        if let albumCoverUrl = URL(string: url ) {
            cell.albumTitle.text = exploreViewModel.getRecommendedAlbum(atIndex: index).title
            cell.albumCover.loadAlbumCover(url: albumCoverUrl)
            cell.designCell()
        }
    }
}
