//
//  ViewModelDelegate.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/24.
//

import Foundation

protocol ExploreMusicViewModelDelegate: AnyObject {
    func reloadView()
    func show(error: String)
}