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
    private weak var textSpeedTimer: Timer!
    
    func setupTrackCell(track: Track) {
        guard let albumCoverUrl = URL(string: track.album.cover) else {
            return
        }
        self.trackName.text = track.title
        backupText = track.title
        self.trackCover.loadArtistCover(url: albumCoverUrl)
        self.artistName.text = "@ "+track.artist.name
        startMovingText()
    }
    
    func startMovingText() {
            textSpeedTimer?.invalidate()
            textSpeedTimer = Timer.scheduledTimer(withTimeInterval: 0.35, repeats: true) { [weak self]_ in
                    DispatchQueue.main.async {
                        if let text = self?.trackName.text, self?.backupText?.count ?? 0 > 6 {
                            let index = text.index(after: text.startIndex)
                            let updateText = String(text[index...])
                            self?.trackName.text = updateText
                            if  self?.trackName.text?.count == 1 {
                                self?.trackName.text = self?.backupText
                            }
                        }
                }
        }
    }
    
}
