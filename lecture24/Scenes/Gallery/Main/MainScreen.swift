//
//  MainScreen.swift
//  lecture24
//
//  Created by MacBook Pro on 08.05.24.
//

import UIKit
import Network

class MainScreen: UIViewController {
    
    //    MARK: - Variables
    public var images: [ScreenImage] = []
    fileprivate let urlString: String = "https://api.unsplash.com/photos/?per_page=100&client_id=m8qjURtWdgGpMMVfVf3LRLDi4POAimfrSsTzcW5o228"
    private let networkService = NetworkService()
    
    //    MARK: - Diffable DataSource & DataSourceSnapshot - typealias
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ScreenImage>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, ScreenImage>
    
    private var dataSource: DataSource!
    private var snapshot = DataSourceSnapshot()
    
    enum Section {
        case main
    }
    
    //    MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.identifier)
        collectionView.backgroundColor = .tertiarySystemBackground
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionViewDataSource()
        applySnapshot()
        fetchData()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        collectionView.delegate = self
    }
    
    // MARK: - Diffable Data Source Setup
    private func setupCollectionViewDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, screenImage) -> GalleryCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.identifier, for: indexPath) as? GalleryCell
            let viewModel = GalleryCollectionViewCellViewModel(image: screenImage)
            cell?.updateCell(with: viewModel)
            return cell
        })
    }

    // MARK: - Snapshot
    private func applySnapshot() {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(images)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    //    MARK: - Function for networking
    private func fetchData() {
        networkService.getData(urlString: urlString) { [weak self] (result: Result<[ScreenImage], Error>) in
            switch result {
            case .success(let images):
                self?.images = images
                DispatchQueue.main.async {
                    self?.applySnapshot()
                }
            case .failure(let error):
                print("Failed to fetch data: \(error)")
            }
        }
    }
}

extension MainScreen: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedImage = dataSource.itemIdentifier(for: indexPath) else { return } 
        print(selectedImage)
//        let secondScreen = SecondScreen(selectedImage: selectedImage)
//        navigationController?.pushViewController(secondScreen, animated: true)
    }
}
