//
//  ArtistPopularityChartViewController.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/23/24.
//

import UIKit

final class ArtistPopularityChartViewController: UIViewController {
    
    // MARK: - Properties
    
//    private var chartData = ChartModel.data()
    
    // MARK: - UI Components
    
    private let rootView = ArtistPopularityChartView()
    private lazy var collectionView = rootView.collectionView
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setRegister()
    }
}

// MARK: - Extensions

extension ArtistPopularityChartViewController {
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setRegister() {
        collectionView.register(PopularityCollectionViewCell.self, forCellWithReuseIdentifier: PopularityCollectionViewCell.className)
    }
}

extension ArtistPopularityChartViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularityCollectionViewCell.className, for: indexPath) as? PopularityCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(
                ranking: 10,
                albumImg: .imgAlbumExample,
                title: "Locked out of Heaven",
                numberOfPlays: "1,915,943,900",
                is19Plus: true
            )
        return cell
    }
}

extension ArtistPopularityChartViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 62)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
