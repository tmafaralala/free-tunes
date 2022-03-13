//
//  CategoriesViewController.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit
import AVFoundation

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
        URLSession.shared.makeRequest(url: url, method: .get, returnModel: Artists.self) {[weak self] result in
            switch result {
            case .success(let topArtists):
                self?.exploreViewModel.storeArtistsData(artists: topArtists.artists)
                DispatchQueue.main.async {
                    self?.setUpExploreCollectionView()
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


class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var looper: AVPlayerLooper!
    var player: AVQueuePlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MyCollectionViewCell")
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.isPagingEnabled = true
    }

    func loadRadio(radioURL: String) {

            guard let url = URL.init(string: radioURL) else { return }
            let playerItem = AVPlayerItem.init(url: url)
            player = AVQueuePlayer(playerItem: playerItem)
            looper = AVPlayerLooper(player: player, templateItem: playerItem)
            player?.play()
        }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myCollectionView.collectionViewLayout.invalidateLayout()
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.cellImage.image = UIImage(named: "500x500")
        cell.trackName.text = "Abalele"
        cell.artistName.text = "Kabza de small"
        cell.styleLikeIcon()
        cell.styleShareIcon()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        looper = nil
        loadRadio(radioURL: "https://cdns-preview-3.dzcdn.net/stream/c-34f6682187fd47601e177f80e33cb38a-3.mp3")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if player.volume != 0 {
            player.volume = 0
            return
        }
        player.volume = 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: view.bounds.height)
        
    }

}

