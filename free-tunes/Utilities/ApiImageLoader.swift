//
//  ApiImageLoader.swift
//  free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/02/25.
//

import UIKit

extension UIImageView {
    func loadAlbumCover(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
