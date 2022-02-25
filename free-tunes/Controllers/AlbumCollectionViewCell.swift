//
//  AlbumCollectionViewCell.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    
    func designCell() {
        albumCover.layer.cornerRadius = 13.0
        albumCover.clipsToBounds = true
        albumCover.layer.shadowColor = UIColor.darkGray.cgColor
        albumCover.layer.shadowOffset = CGSize(width: 20.0, height: 20.0)
        albumCover.layer.shadowRadius = 13.0
        albumCover.layer.shadowOpacity = 0.9
    }
}
