//
//  SecondScreen.swift
//  lecture24
//
//  Created by MacBook Pro on 09.05.24.
//

import UIKit

class SecondScreen: UIViewController {
    
//    MARK: - Variables
    public var images: [UIImage]
    private var selectedIndex: Int
//    private var selectedImage: UIImage

//    MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        collectionView.backgroundColor = .tertiarySystemBackground
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
//    MARK: - Lifecycle
//    init(images: [UIImage], selectedIndex: Int) {
//        self.images = images
//        self.selectedIndex = selectedIndex
//        super.init(nibName: nil, bundle: nil)
//    }
//    
    
    init(images: [UIImage], selectedIndex: Int, selectedImage: UIImage) {
           self.images = images
           self.selectedIndex = images.firstIndex(of: selectedImage) ?? 0
           super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        scrollToSelectedIndex()
    }
    
    //    MARK: - Functions
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func scrollToSelectedIndex() {
        let indexPath = IndexPath(item: selectedIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
}
