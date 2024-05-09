//
//  SecondScreenViewModel.swift
//  lecture24
//
//  Created by MacBook Pro on 09.05.24.
//

import Foundation

class SecondScreenViewModel {
    
    private var image: ScreenImage
    init(image: ScreenImage) {
        self.image = image
    }
    
    var imageUrl: URL? {
        return URL(string: image.urls.regular)
    }
}
