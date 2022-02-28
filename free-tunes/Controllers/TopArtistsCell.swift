//
//  TopArtistsCell.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/28.
//

import UIKit

class TopArtistsCell: UICollectionViewCell {
    @IBOutlet weak var topArtistsCellLabel: UILabel!
    @IBOutlet weak var topArtistsCellImage: UIImageView!
    func designCell() {
        topArtistsCellImage.layer.cornerRadius = 13.0
        topArtistsCellImage.clipsToBounds = true
        topArtistsCellImage.layer.shadowColor = UIColor.darkGray.cgColor
        topArtistsCellImage.layer.shadowOffset = CGSize(width: 20.0, height: 20.0)
        topArtistsCellImage.layer.shadowRadius = 13.0
        topArtistsCellImage.layer.shadowOpacity = 0.9
    }
}
