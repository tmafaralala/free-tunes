//
//  TrackCollectionViewCell.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/13.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {

// MARK: - Interface Builder Outlets
    @IBOutlet private weak var trackCover: UIImageView!
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var trackName: UILabel!
    private var backupText: String!
    private var timer: Timer!
    
    func setupTrackCell(track: Track) {
        guard let albumCoverUrl = URL(string: track.album.cover) else {
            return
        }
        self.trackName.text = track.title
        self.trackCover.loadArtistCover(url: albumCoverUrl)
        self.artistName.text = "@ "+track.artist.name
        backupText = track.title
        startMovingText()
    }
    
    func startMovingText() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { [weak self]_ in
            DispatchQueue.main.async {
                if ((self?.trackName.text?.isEmpty) != nil) {
                    self?.trackName.text = self?.backupText
                }
                if let text = self?.trackName.text, !text.isEmpty {
                    let index = text.index(after: text.startIndex)
                    self?.trackName.text = self?.trackName.text?.substring(from: index)
                }
            }
        }
    }
    
    deinit {
        timer.invalidate()
    }
}
