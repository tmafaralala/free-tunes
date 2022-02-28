//
//  CategoriesViewController.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit
let authManager = AuthController()
class ArtistExplorerViewController: UIViewController {

    @IBOutlet weak var artistCollectionView: UICollectionView!
    private lazy var exploreViewModel = ExploreViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        getExploreViewContent()
    }
    func setUpExploreCollectionView() {
        artistCollectionView.dataSource = self
        artistCollectionView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    func getExploreViewContent() {
        let url = Constants.artistExploreContentUrl
        URLSession.shared.makeRequest(url: url, method: .get, returnModel: Artists.self) { result in
            switch result {
            case .success(let topArtists):
                self.exploreViewModel.storeArtistsData(artists: topArtists.artists)
                DispatchQueue.main.async {
                    self.setUpExploreCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ArtistExplorerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        exploreViewModel.numberOfArtists
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = artistCollectionView.dequeueReusableCell(withReuseIdentifier: "TopArtistCell", for: indexPath)
                as? TopArtistsCell
        else {
            return UICollectionViewCell()
        }
        setupArtistCell(url: exploreViewModel.getArtist(atIndex: indexPath.item).cover, cell: cell,
            index: indexPath.item)
        return cell
    }
    func setupArtistCell(url: String, cell: TopArtistsCell, index: Int ) {
        if let albumCoverUrl = URL(string: url ) {
            cell.topArtistsCellLabel.text = exploreViewModel.getArtist(atIndex: index).name
            cell.topArtistsCellImage.loadArtistCover(url: albumCoverUrl)
            cell.designCell()
        }
    }
}
