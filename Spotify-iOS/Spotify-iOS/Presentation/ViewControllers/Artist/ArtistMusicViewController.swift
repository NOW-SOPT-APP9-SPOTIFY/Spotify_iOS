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
    
    private let rootView = ArtistHeaderView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
