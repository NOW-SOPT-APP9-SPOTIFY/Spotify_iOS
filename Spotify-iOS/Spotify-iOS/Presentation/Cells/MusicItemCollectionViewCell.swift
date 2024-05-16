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
            $0.textAlignment = .center
            
        }
        
        musicianName.do {
            $0.text = "앨범 · Bruno Mars"
            $0.font = UIFont(name: PretendardType.R.rawValue, size: 10)
            $0.textColor = .white
            $0.textAlignment = .center
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
        

    }
}
