//
//  ArtistMusicView.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import UIKit

import SnapKit

final class ArtistMusicView: UIView {

    // MARK: - UI Components
    
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

// MARK: - Extensions

private extension ArtistMusicView {
    
    func setStyle() {
    }
    
    func setHierarchy() {
    }
    
    func setLayout() {
    }
}
