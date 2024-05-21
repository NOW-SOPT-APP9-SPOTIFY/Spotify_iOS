//
//  Button3Cell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class Button3Cell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let mainImageView = UIImageView().then { $0.backgroundColor = .red }
    private let genreTitle = UILabel().then { $0.text = "사회 및 문화"}
    private let mcName = UILabel().then { $0.text = "Podcast Malam Kliwon"}
    private let programName = UILabel().then { $0.text = "프로그램 • Podkesmas Asia"}
    
    private lazy var vStackView = UIStackView(
        arrangedSubviews: [
            mainImageView,
            genreTitle,
            mcName,
            programName
        ]
        
    ).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.setCustomSpacing(8, after: mainImageView)
        $0.distribution = .fill
        $0.spacing = 1
    }
    
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
    
    // MARK: - UI & Layout
    
    private func setUI() {
        
        genreTitle.do {
            $0.font = .font(.small_kr)
            $0.textColor = .spotifyGreen
        }
        
        mcName.do {
            $0.font = .font(.regular_en_bold)
            $0.textColor = .white
        }
        
        programName.do {
            $0.font = .font(.regular_en)
            $0.textColor = .spotifyGray30
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(vStackView)
    }
    
    private func setLayout() {
        
        vStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.height.equalTo(144)
            $0.width.equalTo(mainImageView.snp.height)
        }
    }
    
    // MARK: - Methods
    
    func bindData(data: ShowModel) {
        self.mainImageView.image = data.image
        self.genreTitle.text = data.genre
        self.mcName.text = data.mcName
        self.programName.text = data.title
    }
    
}
