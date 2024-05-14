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
    
    // MARK: - UIComponents
    
    private let musicTitle = UILabel()
    private lazy var progressBar = MusicProgressBarView() // 이걸 5개 반복해서 하면 될 듯
    private let progressBarStackView = UIStackView()
    private lazy var muteButton = UIButton()
    private let mainAlbumImage = UIImage()
    private let subAlbumImage = UIImage()
    private let albumName = UILabel()
    private let musicianName = UILabel() // 앨범 아래에 있는 앨범/브루노 마스 이렇게 되어 있는 부분
    private lazy var addPlaylistButton = UIButton()
    private lazy var optionButton = UIButton()
    private let albumInfo = UILabel()
    private lazy var playButton = UIButton()
    
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
        musicTitle.do {
            $0.text = "Bruno Mars - Grenade"
//          $0.font = .GothamBook(weight: 400 , size: 11)
            $0.textColor = .white
            $0.textAlignment = .left
        }
        
        for i in 0 ..< 5 { // 이게 되나...?
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
        
    }
    
    func setHierarchy() {
        addSubview(progressBarStackView)
    }
    
    func setLayout() {
        
    }
}
