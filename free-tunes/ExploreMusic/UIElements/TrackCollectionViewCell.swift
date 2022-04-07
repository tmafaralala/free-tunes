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
    @IBOutlet private weak var header: UILabel!
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
        styleCell()
    }
    
    func styleCell() {
        startMovingText()
        addBottomGradient()
        addTopGradient()
        buildCellHeader()
    }
    
    func buildCellHeader() {
        guard let firstColor = UIColor(named: "AppPrimaryColor")?.cgColor else {
            return
        }
        header.buildCustomLabel(labelFirstPart: "free",
                                firstColor: firstColor,
                                labelSecondPart: "Tunes",
                                secondColor: UIColor.white.cgColor,
                                size: 28)
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
    
    func addBottomGradient() {
        let sHeight:CGFloat = 200.0
        let shadow = UIColor.black.withAlphaComponent(0.45).cgColor
        let bottomImageGradient = CAGradientLayer()
        bottomImageGradient.frame = CGRect(x: 0, y: self.bounds.height - sHeight, width: self.bounds.width, height: sHeight)
        bottomImageGradient.colors = [UIColor.clear.cgColor, shadow]
        trackCover.layer.insertSublayer(bottomImageGradient, at: 0)
    }
    
    func addTopGradient() {
        let sHeight:CGFloat = 200.0
        let shadow = UIColor.black.withAlphaComponent(0.38).cgColor
        let topImageGradient = CAGradientLayer()
        topImageGradient.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: sHeight)
        topImageGradient.colors = [shadow, UIColor.clear.cgColor]
        trackCover.layer.insertSublayer(topImageGradient, at: 0)
    }
    
}
