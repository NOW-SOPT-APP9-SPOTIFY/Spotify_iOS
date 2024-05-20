//
//  String+.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/20/24.
//

import UIKit

extension String {
    
    func getLabelContentSize(withFont font: UIFont) -> CGSize {
        let label = UILabel()
        label.font = font
        label.text = self
        return label.intrinsicContentSize
    }
}
