//
//  ArtistMusicViewController.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import UIKit

import SnapKit

final class ArtistMusicViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - UI Components
    
    let pageVC: UIPageViewController
    private let rootView = ArtistMusicView()
    
    // MARK: - Life Cycles
    
    init(pageVC: UIPageViewController) {
        self.pageVC = pageVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRootViewConstraint()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        /// PageViewController의 height를 해당 뷰 컨텐츠 사이즈만큼 설정하여 동적 높이를 가지도록 합니다.
        pageVC.view.snp.makeConstraints {
            $0.height.equalTo(view.frame.height)
        }
    }
}

private extension ArtistMusicViewController {
    
    func setRootViewConstraint() {
        view.snp.makeConstraints {
            $0.width.equalTo(pageVC.view.bounds.width)
        }
    }
}
