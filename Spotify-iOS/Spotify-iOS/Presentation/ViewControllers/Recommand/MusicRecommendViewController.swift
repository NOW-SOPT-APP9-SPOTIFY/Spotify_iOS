//
//  RecommendViewController.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/14/24.
//

import UIKit
import Combine

import SnapKit
import Then

struct gradientColor {
    let firstColor: CGColor
    let secondColor: CGColor
    let thirdColor: CGColor
}

extension gradientColor {
    static func gradientDummy() -> [gradientColor] {
        return [
            gradientColor(
                firstColor: .init(red: 255/255, green: 185/255, blue: 6/255, alpha: 0.33),
                secondColor: .init(red: 161/255, green: 160/255, blue: 158/255, alpha: 0.14),
                thirdColor: .init(red: 109/255, green: 109/255, blue: 109/255, alpha: 0.14)),
            
            gradientColor(
                firstColor: .init(red: 255/255, green: 223/255, blue: 161/255, alpha: 0.3),
                secondColor: .init(red: 198/255, green: 183/255, blue: 155/255, alpha: 0.12),
                thirdColor: .init(red: 149/255, green: 149/255, blue: 149/255, alpha: 0.14)),
            
            gradientColor(
                firstColor: .init(red: 169/255, green: 11/255, blue: 11/255, alpha: 1),
                secondColor: .init(red: 91/255, green: 26/255, blue: 26/255, alpha: 0.88),
                thirdColor: .init(red: 35/255, green: 35/255, blue: 35/255, alpha: 1))
        ]
    }
}

class MusicRecommendViewController: UIViewController {
    
    // MARK: - Properties
    
    let headerTitle: [String] = ["Taylor Swift"]
    var albumArray: [Album] = []
    private let gradientList = gradientColor.gradientDummy()
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - UIComponents
    
    let musicRecommendView = MusicRecommendView()
    let musicProgressBarView = MusicProgressBarView()
    
    let blurView = BlurView(effect: UIBlurEffect(style: .dark))
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = musicRecommendView
        
        if let navigationController = self.navigationController {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAlbumInfo()
        musicProgressBarView.progress = CGFloat.random(in: 0...1)
        addTarget()
        setRegister()
        setDelegate()
        bind()
    }
    
    // MARK: - Methods
    
    func addTarget() {
        musicRecommendView.removeButton.addTarget(self, action: #selector(chipButtonDidTap), for: .touchUpInside)
        
        navigationItem.hidesBackButton = true
    }
    
    func setRegister() {
        musicRecommendView.musicRecommendationCollectionView.register(
            MusicCollectionViewHeaderCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: MusicCollectionViewHeaderCell.className
        )
        musicRecommendView.musicRecommendationCollectionView.register(
            MusicItemCollectionViewCell.self,
            forCellWithReuseIdentifier: MusicItemCollectionViewCell.className
        )
    }
    
    func setDelegate() {
        musicRecommendView.musicRecommendationCollectionView.delegate = self
        musicRecommendView.musicRecommendationCollectionView.dataSource = self
    }
    
    private func presentBlurView(index: Int) {
        let albumId = albumArray[index].id
        let albumTitle = albumArray[index].albumName
        let albumArtist = albumArray[index].artist.artistName
        
        print("⭐️⭐️⭐️ albumId= \(albumId) ⭐️⭐️⭐️")
        blurView.show(in: self.view)
        
        blurView.setData(id: albumId, title: albumTitle, artist: albumArtist) // 여기서 해당하는 Cell의 앨범 id를 받습니다.!
    }
    
    private func bind() {
        blurView.artistDidTapSubject
            .sink { [weak self] in
                self?.presentArtistViewController()
            }
            .store(in: &cancellables)
    }
    
    // TODO: 4번째 뷰로 가는 로직 작성을 하면됩니다.
    // 아마 아티스트 ID가 필요할텐데 현재 뷰에서 albumArray[index].id 를 가져가와 setData 해주면 됩니다. !!
    // 지금은 그냥 예시로 뷰가 넘어가는지 ViewController로 시험을 해봤어요!
    private func presentToArtistViewController() {
        let artistViewController = ViewController()
        artistViewController.view.backgroundColor = .spotifyGray30
        navigationController?.pushViewController(artistViewController, animated: true)
    }
    
    // MARK: - @Objc Function
    
    @objc
    func chipButtonDidTap() {
        if let navigationController = self.navigationController {
            let homeViewController = HomeViewController()
            var viewControllers = navigationController.viewControllers
            viewControllers.removeLast()
            viewControllers.append(homeViewController)
            navigationController.setViewControllers(viewControllers, animated: false)
        }
    }
    
    @objc
    private func dismissBlurView() {
        blurView.hide()
    }
}

// MARK: - UICollectionViewDataSource

extension MusicRecommendViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // 데이터가 없기 때문에 일단은 하드코딩으로 처리
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicItemCollectionViewCell.className, for: indexPath) as?
                MusicItemCollectionViewCell else { return UICollectionViewCell()}
        cell.bindData(albumArray[indexPath.row])
        cell.bindGradient(data: gradientList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MusicCollectionViewHeaderCell.className, for: indexPath) as? MusicCollectionViewHeaderCell else { return UICollectionReusableView() }
        headerView.bindTitle(musicianName: headerTitle[0])
        return headerView
    }
    
}

// MARK: - UICollectionViewDelegate

extension MusicRecommendViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentBlurView(index: indexPath.row)
    }
}

// MARK: - Network

extension MusicRecommendViewController {
    private func fetchAlbumInfo() {
        SpotifyService.shared.fetchRecommendDatas { [weak self] response in
            switch response {
            case .success(let data):
                guard let baseResponse = data as? RecommendDTO else {
                    print("데이터를 불러오는 데 실패했습니다.")
                    return
                }
                
                //                print("🫠🫠\(baseResponse.data)🫠🫠")
                self?.albumArray = baseResponse.data.albums
                DispatchQueue.main.async { // UI 업데이트는 메인 쓰레드에서
                    self?.musicRecommendView.musicRecommendationCollectionView.reloadData()
                }
                
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
    
}
