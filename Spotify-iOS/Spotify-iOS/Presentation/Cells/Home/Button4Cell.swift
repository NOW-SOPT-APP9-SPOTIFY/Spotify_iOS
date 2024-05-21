//
//  Button4Cell.swift
//  Spotify-iOS
//
//  Created by 이명진 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class Button4Cell: UICollectionViewCell {
    
    // MARK: - UIComponents
    
    private let mainImageView = UIImageView().then { $0.backgroundColor = .red }
    private let songName = UILabel().then { $0.text = "Doo-Wops \n& Hooligans"}
    
    private lazy var vStackView = UIStackView(
        arrangedSubviews: [
            mainImageView,
            songName
        ]
        
    ).then {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 8
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
        songName.do {
            $0.textColor = .white
            $0.font = .font(.regular_en)
            $0.numberOfLines = 2
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
            $0.height.equalTo(91)
            $0.width.equalTo(mainImageView.snp.height)
        }
    }
    
    // MARK: - Methods
    
    func bindData(data: RecentlyModel) {
        self.mainImageView.image = data.image
        self.songName.text = data.title
    }
    
}
