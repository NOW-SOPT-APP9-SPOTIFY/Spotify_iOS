//
//  ArtistViewController.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/12/24.
//

import UIKit

final class ArtistViewController: UIViewController {
    
    private let rootView = ArtistView()

    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
