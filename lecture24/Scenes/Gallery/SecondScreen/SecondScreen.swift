//
//  SecondScreen.swift
//  lecture24
//
//  Created by MacBook Pro on 09.05.24.
//

import UIKit

class SecondScreen: UIViewController {
    
    //    MARK: - Variables
    public var images: [ScreenImage]
    private var selectedIndex: Int
    public var viewModel: SecondScreenViewModel

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
    init(images: [ScreenImage], selectedIndex: Int) {
        self.images = images
        self.selectedIndex = selectedIndex
        self.viewModel = SecondScreenViewModel(image: images[selectedIndex])
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        scrollToItem(at: selectedIndex)
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
    
    private func scrollToItem(at index: Int) {
            collectionView.layoutIfNeeded()
            let indexPath = IndexPath(item: index, section: 0)
            if collectionView.numberOfItems(inSection: 0) > index {
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }

