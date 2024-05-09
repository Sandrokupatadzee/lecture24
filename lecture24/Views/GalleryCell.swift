//
//  GalleryCell.swift
//  lecture24
//
//  Created by MacBook Pro on 08.05.24.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    static let identifier = "GalleryCell"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.tintColor = .label
        image.clipsToBounds = true
        return image
    }()

//    MARK: - Initialization
    override init(frame: CGRect) {
         super.init(frame: frame)
         setupUI()
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
//    MARK: - Functions
    private func setupUI() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func updateCell(with item: GalleryCollectionViewCellViewModel) {
        guard let url = item.ImageUrl else { return }
        imageView.fetchImage(url: url)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
}
