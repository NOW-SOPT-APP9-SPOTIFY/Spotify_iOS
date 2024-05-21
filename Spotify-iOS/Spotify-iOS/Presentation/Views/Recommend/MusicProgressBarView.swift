//
//  MusicProgressBarView.swift
//  Spotify-iOS
//
//  Created by 김민성 on 5/15/24.
//

import UIKit

import SnapKit
import Then

final class MusicProgressBarView: UIView {
    
    // MARK: - UICompoenets
    
    private let musicProgressBar = UIView()
    
    // MARK: - Properties
    /// progress bar에서 진행 정도를 설정하는 변수
    var progress: CGFloat = 0 {
        didSet { // progress의 값이 변하면 작동
            updateProgress()
        }
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension MusicProgressBarView {
    /// progress 값에 따라 progress bar의 진행 정도를 업데이트 시키는 함수
    func updateProgress() {
        let newWidth = self.bounds.width * progress
        musicProgressBar.frame.size.width = newWidth
    }
}
