//
//  ArtistView.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/12/24.
//

import UIKit

import SnapKit

final class ArtistView: UIView {
    
    // MARK: - UI Components
    
    // TODO: 내비바 디자이너님한테 프레임(높이) 따로 잡아달라고 하기
    private let header = ArtistHeaderView()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ArtistView {
    
    func setStyle() {
        backgroundColor = .spotifyBg
    }
    
    func setHierarchy() {
        self.addSubviews(header)
    }
    
    func setLayout() {
        header.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            
        }
    }
}
