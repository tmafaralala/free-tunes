//
//  ServiceErrors.swift
//  Free-tunes
//
//  Created by Tshwarelo Mafaralala on 2022/03/29.
//

import Foundation

enum ApiError: String, Error {
    case invalidResponse
    case invalidRequest
    case invalidBody
    case invalidUrl
    case invalidData
}
