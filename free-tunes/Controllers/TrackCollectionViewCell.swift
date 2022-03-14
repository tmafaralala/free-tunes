//
//  TrackCollectionViewCell.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/13.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {

//  MARK: - Interface Builder Outlets
    @IBOutlet weak var trackCover: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    
    func setArtistName(artistName: String) {
        self.artistName.text = artistName
    }
    
    func setTrackName(trackName: String) {
        self.trackName.text = trackName
    }
    
    func setTrackCover(url: URL) {
        self.trackCover.loadArtistCover(url: url)
    }
}
