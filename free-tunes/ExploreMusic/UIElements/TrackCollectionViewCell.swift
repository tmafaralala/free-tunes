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
    
    func setupTrackCell(track: Track) {
        guard let albumCoverUrl = URL(string: track.album.cover) else {
            return
        }
        self.trackName.text = track.title
        self.trackCover.loadArtistCover(url: albumCoverUrl)
        self.artistName.text = track.artist.name
    }
}
