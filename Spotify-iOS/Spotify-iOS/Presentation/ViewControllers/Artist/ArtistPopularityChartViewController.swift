//
//  ArtistPopularityChartViewController.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/23/24.
//

import UIKit

final class ArtistPopularityChartViewController: UIViewController {
    
    // MARK: - Properties
    
    let artistId: Int
    private var chartSongs: [Song] = []
    
    // MARK: - UI Components
    
    private let rootView = ArtistPopularityChartView()
    private lazy var collectionView = rootView.collectionView
    
    // MARK: - Life Cycles
    
    init(artistId: Int) {
        self.artistId = artistId
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
        setNavigationBarAndTabBar()
        setDelegate()
        setRegister()
    }
}

// MARK: - Extensions

extension ArtistPopularityChartViewController {
    
    func fetchData() {
        SpotifyService.shared.getArtistChartData(artistId: artistId) { [weak self] response in
            guard let self  = self else { return }
            switch response {
            case .success(let data):
                guard let data = data as? BaseResponse<ArtistChartDTO> else { return }
                self.chartSongs = data.data?.songs ?? []
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
    
    func setNavigationBarAndTabBar() {
        let backButton = UIButton().then {
            $0.setImage(.icBackGray, for: .normal)
            $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        }
        let title = UILabel().then {
            $0.text = "인기"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 17, weight: .bold)
        }
        let stackView = UIStackView(arrangedSubviews: [backButton, title]).then {
            $0.spacing = 0
            $0.axis = .horizontal
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: stackView)
        navigationController?.navigationBar.standardAppearance.backgroundColor = .clear
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setRegister() {
        collectionView.register(PopularityCollectionViewCell.self, forCellWithReuseIdentifier: PopularityCollectionViewCell.className)
    }
    
    // MARK: - Actions
    
    @objc
    func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}

extension ArtistPopularityChartViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chartSongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularityCollectionViewCell.className, for: indexPath) as? PopularityCollectionViewCell else { return UICollectionViewCell() }
        let data = chartSongs[indexPath.item]
            cell.configure(
                ranking: indexPath.item + 1,
                albumImg: .imgAlbumExample,
                title: data.title,
                numberOfPlays: data.listenedCount,
                is19Plus: false
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
