//
//  CategoriesViewController.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit
import AVFoundation

class TrackExplorerViewController: UIViewController {
    
// MARK: - Interface Builder Outlets
    @IBOutlet private weak var trackCollectionView: UICollectionView!
    
    private lazy var exploreViewModel = TrackExplorerViewModel()
    var looper: AVPlayerLooper!
    var player: AVQueuePlayer!

// MARK: - Runtime Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        trackCollectionView.register(UINib(nibName: "TrackCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TrackCollectionViewCell")
        trackCollectionView.isPagingEnabled = true
        getExploreViewContent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
// MARK: - Controller Logic Methods
    func setUpExploreCollectionView() {
        trackCollectionView.dataSource = self
        trackCollectionView.delegate = self
    }
    
    func getExploreViewContent() {
        let url = Constants.artistExploreContentUrl
        URLSession.shared.makeRequest(url: url, method: .get, returnModel: TrackData.self) {[weak self] result in
            switch result {
            case .success(let topTracks):
                self?.exploreViewModel.storeTracksData(tracks: topTracks.tracks.tracks)
                DispatchQueue.main.async {
                    self?.setUpExploreCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

// MARK: - Collection View Extension
extension TrackExplorerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
// MARK: - Collection View Setup Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        exploreViewModel.numberOfTracks
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        guard let cell = trackCollectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath)
                as? TrackCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        setupTrackCell(cell: cell,
            index: indexPath.item)
        return cell
    }
    
// MARK: - Collection View Layout Methods
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: view.bounds.height)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        trackCollectionView.collectionViewLayout.invalidateLayout()
    }
    
// MARK: - Music Player Extension Methods
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        looper = nil
        loadRadio(radioURL: exploreViewModel.getTrack(atIndex: indexPath.item).trackLink)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if player.volume != 0 {
            player.volume = 0
            return
        }
        player.volume = 1.0
    }
    
// MARK: - Collection View Custom Methods
    func setupTrackCell(cell: TrackCollectionViewCell?, index: Int ) {
        guard let currentCell = cell, let albumCoverUrl = URL(string: exploreViewModel.getTrack(atIndex: index).album.cover) else {
            return
        }
        currentCell.setTrackName(trackName: exploreViewModel.getTrack(atIndex: index).title)
        currentCell.setTrackCover(url: albumCoverUrl)
        currentCell.setArtistName(artistName: exploreViewModel.getTrack(atIndex: index).artist.name)
    }
    
    func loadRadio(radioURL: String) {
        guard let url = URL.init(string: radioURL) else { return }
        let playerItem = AVPlayerItem.init(url: url)
        player = AVQueuePlayer(playerItem: playerItem)
        looper = AVPlayerLooper(player: player, templateItem: playerItem)
        player?.play()
    }
}
