//
//  ImageCell.swift
//  lecture24
//
//  Created by MacBook Pro on 09.05.24.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let identifier = "ImageCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updatecell(with image: UIImage) {
        imageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}
