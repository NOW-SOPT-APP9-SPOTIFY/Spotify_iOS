//
//  MusicItemCollectionViewCell.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/14/24.
//

import UIKit

import SnapKit
import Then

class MusicItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    let colors: [CGColor] = [
        .init(red: 255, green: 185, blue: 6, alpha: 0.33),
        .init(red: 161, green: 160, blue: 158, alpha: 0.14),
        .init(red: 109, green: 109, blue: 109, alpha: 0.14)
    ]
    
    // MARK: - UIComponents
    
    private let background = UIView()
    private let gradientLayer = CAGradientLayer()
    
    private let musicTitle = UILabel()
    private lazy var progressBar = MusicProgressBarView() // 이걸 5개 반복해서 하면 될 듯
    private let progressBarStackView = UIStackView()
    private lazy var muteButton = UIImageView()
    private let mainAlbumImage = UIView() // 서버 연결되면 UIImage로 교체
    private let subAlbumImage = UIView() // 서버 연결되면 UIImage로 교체
    private let albumName = UILabel()
    private let musicianName = UILabel() // 앨범 아래에 있는 앨범/브루노 마스 이렇게 되어 있는 부분
    private lazy var addPlaylistButton = UIImageView() // plus 표시 되어 있는 버튼
    private lazy var optionButton = UIImageView()
    private let albumInfo = UILabel()
    private lazy var playButton = UIImageView() 
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension MusicItemCollectionViewCell {
    func setUI() {
        
        gradientLayer.do {
            $0.frame = background.bounds
            $0.colors = colors
            $0.startPoint = CGPoint(x: 0.5, y: 0.0)
            $0.endPoint = CGPoint(x: 0.5, y: 1.0)
        }
        
        background.do {
            $0.backgroundColor = .clear
            $0.layer.addSublayer(gradientLayer)
            $0.layer.cornerRadius = 14
            
        }
        
        
        musicTitle.do {
            $0.text = "Bruno Mars - Grenade"
            $0.font = UIFont(name: GothamType.R.rawValue, size: <#T##CGFloat#>)
            $0.textColor = .white
            $0.textAlignment = .left
        }
        
        for _ in 0 ..< 5 { // 이게 되나...?
            progressBar.do {
                $0.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.2)
                progressBarStackView.addArrangedSubview(progressBar)
            }
            
        }
        
        progressBarStackView.do {
            $0.distribution = .fillEqually
            $0.axis = .horizontal
            $0.spacing = 3
        }
        
        muteButton.do {
            $0.image = UIImage(resource: .icSoundBlack)
        }
        
        mainAlbumImage.do {
            $0.backgroundColor = .spotifyGreen
            $0.layer.cornerRadius = 5
        }
        
        subAlbumImage.do {
            $0.backgroundColor = .spotifyGreen
            $0.layer.cornerRadius = 5
        }
        
        albumName.do {
            $0.text = "Doo-Wops & Hooligans"
            $0.font = UIFont(name: GothamType.B.rawValue, size: 17)
            $0.textColor = .white
            $0.textAlignment = .left
            
        }
        
        musicianName.do {
            $0.text = "앨범 · Bruno Mars"
            $0.font = UIFont(name: PretendardType.R.rawValue, size: 10)
            $0.textColor = .white
            $0.textAlignment = .left
        }
        
        addPlaylistButton.do {
            $0.image = UIImage(resource: .icEllipsisWhite)
        }
        
        optionButton.do {
            $0.image = UIImage(resource: .icPlusCircleWhite)
        }
        
        albumInfo.do {
            $0.text = "2010 · 10곡"
            $0.font = UIFont(name: GothamType.R.rawValue, size: 11)
            $0.textColor = .white
            $0.textAlignment = .right
        }
        
        playButton.do {
            $0.image = UIImage(resource: .icPlayWhite)
        }
        
    }
    
    func setHierarchy() {
        addSubview(progressBarStackView)
    }
    
    func setLayout() {
        background.snp.makeConstraints {
            $0.top.equalToSuperview().offset(140) // top view 만들면 거기에 레이아웃 맞추기
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(466)
        }
        
        musicTitle.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(16)
            $0.leading.equalTo(background.snp.leading).offset(15.91)
            $0.width.equalTo(115)
            $0.height.equalTo(14)
        }
        
        progressBar.snp.makeConstraints {
            $0.top.equalTo(musicTitle.snp.bottom).offset(6)
            $0.leading.equalTo(background.snp.leading).offset(15.91)
            $0.width.equalTo(54)
            $0.height.equalTo(4)
        }
        
        muteButton.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(9.5)
            $0.trailing.equalTo(background.snp.trailing).inset(8.5)
        }
        
        mainAlbumImage.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(86)
            $0.leading.equalTo(background.snp.leading).offset(70.59)
            $0.width.equalTo(201.82)
            $0.height.equalTo(203)
        }
        
        subAlbumImage.snp.makeConstraints {
            $0.top.equalTo(mainAlbumImage.snp.bottom).offset(71)
            $0.leading.equalTo(background.snp.leading).offset(14)
            $0.width.equalTo(53)
            $0.height.equalTo(53)
        }
        
        albumName.snp.makeConstraints {
            $0.top.equalTo(mainAlbumImage.snp.bottom).offset(79.5)
            $0.leading.equalTo(subAlbumImage.snp.trailing).offset(8)
            $0.width.equalTo(193)
            $0.height.equalTo(22)
        }

        musicianName.snp.makeConstraints {
            $0.top.equalTo(albumName.snp.bottom)
            $0.leading.equalTo(subAlbumImage.snp.trailing).offset(8)
            $0.width.equalTo(80)
            $0.height.equalTo(14)
        }

        addPlaylistButton.snp.makeConstraints {
            $0.top.equalTo(subAlbumImage.snp.bottom).offset(14)
            $0.leading.equalTo(background.snp.leading).offset(14.91)
            $0.width.equalTo(20.88)
            $0.height.equalTo(21)
        }
        
        optionButton.snp.makeConstraints {
            $0.top.equalTo(subAlbumImage.snp.bottom).offset(23.5)
            $0.leading.equalTo(background.snp.leading).offset(62.55)
            $0.width.equalTo(16.9)
            $0.height.equalTo(3)
        }
        
        albumInfo.snp.makeConstraints {
            $0.top.equalTo(mainAlbumImage.snp.bottom).offset(142)
            $0.trailing.equalTo(background.snp.trailing).inset(59.65)
            $0.width.equalTo(59.65)
            $0.height.equalTo(14)
        }
        
        playButton.snp.makeConstraints {
            $0.top.equalTo(mainAlbumImage.snp.bottom).offset(133.5)
            $0.trailing.equalTo(background.snp.trailing).inset(13.59)
            $0.width.equalTo(30.82)
            $0.height.equalTo(31)
        }

    }
    
    // 서버 통신 되면 데이터 바인딩 관련해서 적을 내용들
    //    func bindData(
    //        musicTitle: String = "Bruno Mars - Grenade",
    //        albumImage: UIImage,
    //        albumName: String = "Doo-Wops & Hooligans",
    //        musicianName: String = "앨범 · Bruno Mars"
    //        albumInfo: String = "2010 · 10곡"
    //    ) {
    //        self.musicTitle.text = musicTitle
    //        self.mainAlbumImage.image = albumImage
    //        self.albumName.text = albumName
    //        self.musicianName.text = musicianName
    //        self.albumInfo.text = albumInfo
    //    }
}
