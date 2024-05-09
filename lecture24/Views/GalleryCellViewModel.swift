//
//  GalleryCellViewModel.swift
//  lecture24
//
//  Created by MacBook Pro on 09.05.24.
//

import Foundation

struct GalleryCollectionViewCellViewModel {
    
    private var image: ScreenImage
    
    init(image: ScreenImage) {
        self.image = image
    }
    var ImageUrl: URL? {
        URL(string: image.urls.regular)
    }
}
