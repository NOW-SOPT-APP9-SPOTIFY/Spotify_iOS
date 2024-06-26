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
        .init(red: 255/255, green: 185/255, blue: 6/255, alpha: 0.33),
        .init(red: 161/255, green: 160/255, blue: 158/255, alpha: 0.14),
        .init(red: 109/255, green: 109/255, blue: 109/255, alpha: 0.14)
    ]
    
    // MARK: - UIComponents
    
    private let background = UIView()
    let gradientLayer = CAGradientLayer()
    private let musicTitle = UILabel()
    lazy var progressBar1 = MusicProgressBarView(frame: CGRect(x: 0, y: 0, width: 52, height: 4))
    lazy var progressBar2 = MusicProgressBarView(frame: CGRect(x: 0, y: 0, width: 52, height: 4))
    lazy var progressBar3 = MusicProgressBarView(frame: CGRect(x: 0, y: 0, width: 52, height: 4))
    lazy var progressBar4 = MusicProgressBarView(frame: CGRect(x: 0, y: 0, width: 52, height: 4))
    lazy var progressBar5 = MusicProgressBarView(frame: CGRect(x: 0, y: 0, width: 52, height: 4))
    private let progressBarStackView = UIStackView()
    private lazy var muteButton = UIImageView()
    private let mainAlbumImage = UIImageView() // 서버 연결되면 UIImage로 교체
    private let subAlbumImage = UIImageView() // 서버 연결되면 UIImage로 교체
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = background.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension MusicItemCollectionViewCell {
    func setUI() {
        
        gradientLayer.do {
            $0.colors = colors
            $0.startPoint = CGPoint(x: 0.5, y: 0.0)
            $0.endPoint = CGPoint(x: 0.5, y: 1.0)
            $0.cornerRadius = 14
        }
        
        background.do {
            $0.backgroundColor = .clear
            $0.layer.addSublayer(gradientLayer)
            $0.layer.cornerRadius = 14
        }
        
        musicTitle.do {
            $0.text = "Bruno Mars - Grenade"
            $0.font = UIFont(name: GothamType.R.rawValue, size: 11)
            $0.textColor = .white
            $0.textAlignment = .left
            $0.numberOfLines = 1
        }
        
        [progressBar1,
         progressBar2,
         progressBar3,
         progressBar4,
         progressBar5].forEach {
            self.progressBarStackView.addArrangedSubview($0)
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
//            $0.backgroundColor = .spotifyGreen
            $0.layer.cornerRadius = 5
        }
        
        subAlbumImage.do {
//            $0.backgroundColor = .spotifyGreen
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
            $0.numberOfLines = 1
        }
        
        addPlaylistButton.do {
            $0.image = UIImage(resource: .icPlusCircleWhite)
        }
        
        optionButton.do {
            $0.image = UIImage(resource: .icEllipsisWhite)
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
        addSubviews(
            background,
            musicTitle,
            progressBarStackView,
            muteButton,
            mainAlbumImage,
            subAlbumImage,
            albumName,
            musicianName,
            addPlaylistButton,
            optionButton,
            albumInfo,
            playButton
        )
    }
    
    func setLayout() {
        background.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8) // top view 만들면 거기에 레이아웃 맞추기
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(466)
        }
        
        musicTitle.snp.makeConstraints {
            $0.top.equalTo(background.snp.top).offset(16)
            $0.leading.equalTo(background.snp.leading).offset(15.91)
            $0.width.equalTo(282)
            $0.height.equalTo(14)
        }
        
        progressBarStackView.snp.makeConstraints {
            $0.top.equalTo(musicTitle.snp.bottom).offset(6)
            $0.leading.equalTo(background.snp.leading).offset(15.91)
            $0.width.equalTo(269)
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
            $0.width.equalTo(200)
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
        func bindData(_ data: Album) {
            self.musicTitle.text = data.artist.artistName + "-" + data.firstSongName
            self.mainAlbumImage.image = UIImage(named: "imgMusicCard\(data.id)")
            self.subAlbumImage.image = UIImage(named: "imgMusicCard\(data.id)")
            self.albumName.text = data.albumName
            self.musicianName.text = "앨범 ·" + data.artist.artistName
        }
    
    func bindGradient(data: gradientColor) {
        self.gradientLayer.colors = [data.firstColor, data.secondColor, data.thirdColor]
    }
}
