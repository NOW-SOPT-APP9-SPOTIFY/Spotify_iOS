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
    let scrollView = UIScrollView()
    private let contentView = UIView()
    private let header = ArtistHeaderView()
    lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    private let flowLayout = UICollectionViewFlowLayout()
    lazy var tabbarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    let indicatorBar = UIView()
    
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

private extension ArtistView {
    
    func setStyle() {
        backgroundColor = .spotifyBg
        
        scrollView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
        }
        
        pageViewController.view.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        flowLayout.do {
            $0.scrollDirection = .horizontal
        }
        
        tabbarCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
        }
        
        indicatorBar.do {
            $0.backgroundColor = .spotifyGreen
        }
    }
    
    func setHierarchy() {
        self.addSubviews(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            header,
            tabbarCollectionView,
            indicatorBar,
            pageViewController.view
        )
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.snp.width)
        }
        
        header.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        tabbarCollectionView.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.top.equalTo(header.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(9)
            $0.trailing.equalToSuperview()
        }
        
        indicatorBar.snp.makeConstraints {
            $0.width.equalTo(0)
            $0.height.equalTo(2)
            $0.top.equalTo(tabbarCollectionView.snp.bottom)
            $0.leading.equalToSuperview().offset(16.5)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(indicatorBar.snp.bottom).offset(2)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
