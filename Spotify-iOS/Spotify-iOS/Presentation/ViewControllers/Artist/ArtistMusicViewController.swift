//
//  ArtistMusicViewController.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import UIKit

import SnapKit

final class ArtistMusicViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - UI Components
    
    let pageVC: UIPageViewController
    private let rootView = ArtistMusicView()
    private lazy var collectionView = rootView.collectionView
    
    // MARK: - Life Cycles
    
    init(pageVC: UIPageViewController) {
        self.pageVC = pageVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRootViewConstraint()
        setDelegate()
        setRegister()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

//        collectionView.invalidateIntrinsicContentSize()
        print(collectionView.contentSize.height)
        /// PageViewController의 height를 해당 뷰 컨텐츠 사이즈만큼 설정하여 동적 높이를 가지도록 합니다.
        pageVC.view.snp.makeConstraints {
            $0.height.equalTo(view.frame.height)
        }
    }
}

private extension ArtistMusicViewController {
    
    func setRootViewConstraint() {
        view.snp.makeConstraints {
            $0.width.equalTo(pageVC.view.bounds.width)
        }
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setRegister() {
        collectionView.register(PopularityCollectionViewCell.self, forCellWithReuseIdentifier: PopularityCollectionViewCell.className)
        collectionView.register(ArtistRecommendationCollectionViewCell.self, forCellWithReuseIdentifier: ArtistRecommendationCollectionViewCell.className)
        
        collectionView.register(ArtistMusicHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArtistMusicHeaderReusableView.className)
    }
}

extension ArtistMusicViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = Section.allCases[section]
        switch sectionType {
        case .popularity:
            return 5
        case .artistRecommendation:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .popularity:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularityCollectionViewCell.className, for: indexPath) as? PopularityCollectionViewCell else { return UICollectionViewCell() }
//            let data = popularMusics[indexPath.item]
            cell.configure(
                ranking: 1,
                albumImg: .imgProfile,
                title: "Locked out of Heaven",
                numberOfPlays: "1,915,943,900",
                is19Plus: true
            )
            return cell
        case .artistRecommendation:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistRecommendationCollectionViewCell.className, for: indexPath) as? ArtistRecommendationCollectionViewCell else { return UICollectionViewCell() }
//            cell.configure()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ArtistMusicHeaderReusableView.className, for: indexPath) as? ArtistMusicHeaderReusableView
            else { return UICollectionReusableView() }
            
            let section = Section.allCases[indexPath.section]
            switch section {
            case .popularity:
                header.configure(title: Section.popularity.rawValue, isIconIncluded: true)
            case .artistRecommendation:
                header.configure(title: Section.artistRecommendation.rawValue, isIconIncluded: false)
//            default:
//                header.configure(title: "", isIconIncluded: false)
            }
            return header
            
//        case UICollectionView.elementKindSectionFooter:
//            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeFooterReusableView.identifier, for: indexPath) as? HomeFooterReusableView
//            else { return UICollectionReusableView() }
//            footer.configure(pageNumber: carouselMovies.count)
//            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension ArtistMusicViewController: UICollectionViewDelegate {
}
