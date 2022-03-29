//
//  TrackExplorerViewController.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit
import AVFoundation

class ExploreMusicViewController: UIViewController {
    
// MARK: - Interface Builder Outlets
    @IBOutlet private weak var trackCollectionView: UICollectionView!
    
    private lazy var exploreViewModel = ExploreMusicViewModel(repository: ExploreMusicRepository(), delegate: self)
    private var looper: AVPlayerLooper!
    private var player: AVQueuePlayer!

// MARK: - Runtime Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpExploreMusicCollectionView()
        exploreViewModel.fetchMusicData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
// MARK: - Controller Logic Methods
    func setUpExploreMusicCollectionView() {
        trackCollectionView.dataSource = self
        trackCollectionView.delegate = self
        trackCollectionView.register(UINib(nibName: "TrackCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TrackCollectionViewCell")
        trackCollectionView.isPagingEnabled = true
    }

}

// MARK: - Collection View Extension
extension ExploreMusicViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        
        cell.setupTrackCell(albumCover: exploreViewModel.getTrack(atIndex: indexPath.item)?.album.cover ?? "",
                            trackName: exploreViewModel.getTrack(atIndex: indexPath.item)?.title ?? "",
                            artistName: exploreViewModel.getTrack(atIndex: indexPath.item)?.artist.name ?? "")
        return cell
    }
    
// MARK: - Collection View Layout Methods
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: view.bounds.height)
    }
    
// MARK: - Music Player Extension Methods
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        looper = nil
        loadRadio(radioURL: exploreViewModel.getTrack(atIndex: indexPath.item)?.trackLink ?? "")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if player.volume != 0 {
            player.volume = 0
            return
        }
        player.volume = 1.0
    }
    
// MARK: - Collection View Custom Methods
    func loadRadio(radioURL: String) {
        guard let url = URL.init(string: radioURL) else { return }
        let playerItem = AVPlayerItem.init(url: url)
        player = AVQueuePlayer(playerItem: playerItem)
        looper = AVPlayerLooper(player: player, templateItem: playerItem)
        player?.play()
    }
}

extension ExploreMusicViewController: ExploreMusicViewModelDelegate {
    func reloadView() {
        trackCollectionView.collectionViewLayout.invalidateLayout()
        trackCollectionView.reloadData()
    }
    
    func show(error: String) {
        displayErrorAlert(alertTitle: "Data error", alertMessage: error, alertActionTitle: "Ok")
    }
}
