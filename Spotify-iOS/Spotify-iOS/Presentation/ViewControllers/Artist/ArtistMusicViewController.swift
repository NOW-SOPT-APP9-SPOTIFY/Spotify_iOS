//
//  ArtistMusicViewController.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import UIKit

import SnapKit

protocol PushVCDelegate: AnyObject {
    func pushVC(_ viewController: UIViewController)
}

final class ArtistMusicViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: PushVCDelegate?
    var artistId: Int = 1
    private var songs: [Song] = []
    
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
        
        fetchData()
        setRootViewConstraint()
        setDelegate()
        setRegister()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.layoutIfNeeded()
        
        /// PageViewController의 height를 해당 뷰 컨텐츠 사이즈만큼 설정하여 동적 높이를 가지도록 합니다.
        pageVC.view.snp.makeConstraints {
            $0.height.equalTo(collectionView.contentSize.height)
        }
        view.snp.makeConstraints {
            $0.height.equalTo(collectionView.contentSize.height)
        }
    }
}

private extension ArtistMusicViewController {
    
    func fetchData() {
        SpotifyService.shared.getArtistData(artistId: artistId) { [weak self] response in
            guard let self  = self else { return }
            switch response {
            case .success(let data):
                guard let data = data as? BaseResponse<ArtistDetailDTO> else { return }
                self.songs = data.data?.songs ?? []
                collectionView.reloadData()
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
    
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
        collectionView.register(PopularMusicCollectionViewCell.self, forCellWithReuseIdentifier: PopularMusicCollectionViewCell.className)
        
        collectionView.register(ArtistMusicHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ArtistMusicHeaderReusableView.className)
        collectionView.register(ArtistMusicFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ArtistMusicFooterReusableView.className)
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
            return songs.isEmpty ? 0 : 5
        case .artistRecommendation:
            return 1
        case .popularMusic:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .popularity:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularityCollectionViewCell.className, for: indexPath) as? PopularityCollectionViewCell else { return UICollectionViewCell() }
            let data = songs[indexPath.item]
            cell.configure(
                ranking: indexPath.item + 1,
                albumImg: .imgAlbumExample,
                title: data.title,
                numberOfPlays: data.listenedCount,
                is19Plus: false
            )
            return cell
        case .artistRecommendation:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistRecommendationCollectionViewCell.className, for: indexPath) as? ArtistRecommendationCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case .popularMusic:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMusicCollectionViewCell.className, for: indexPath) as? PopularMusicCollectionViewCell else { return UICollectionViewCell() }
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
                header.configure(
                    title: Section.popularity.rawValue,
                    isIconIncluded: true,
                    isLeadingPaddingIncluded: true
                )
                header.delegate = self
            case .artistRecommendation:
                header.configure(
                    title: Section.artistRecommendation.rawValue,
                    isIconIncluded: false,
                    isLeadingPaddingIncluded: false
                )
            case .popularMusic:
                header.configure(
                    title: Section.popularMusic.rawValue,
                    isIconIncluded: false,
                    isLeadingPaddingIncluded: true
                )
            }
            return header
            
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ArtistMusicFooterReusableView.className, for: indexPath) as? ArtistMusicFooterReusableView
            else { return UICollectionReusableView() }
            footer.configure(title: "디스코그래피 보기")
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension ArtistMusicViewController: UICollectionViewDelegate {
}

extension ArtistMusicViewController: HeaderTapEventDelegate {
    
    func popularityHeaderDidTap() {
        delegate?.pushVC(ArtistPopularityChartViewController())
    }
}
