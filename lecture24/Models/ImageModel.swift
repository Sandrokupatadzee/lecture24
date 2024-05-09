//
//  ImageModel.swift
//  lecture24
//
//  Created by MacBook Pro on 09.05.24.
//

import Foundation

struct ScreenImage: Decodable, Hashable {
    let urls: URLS
}

struct URLS: Decodable, Hashable {
    let regular: String
}
