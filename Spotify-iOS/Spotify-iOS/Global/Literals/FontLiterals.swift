//
//  FontLiterals.swift
//  Spotify-iOS
//
//  Created by 김나연 on 5/11/24.
//

import UIKit

enum PretendardType: String {
    case R = "Pretendard-Regular"
    case M = "Pretendard-Medium"
    case SB = "Pretendard-SemiBold"
    case B = "Pretendard-Bold"
}

enum GothamType: String {
    case R = "Gotham-Book"
    case M = "Gotham-Medium"
    case B = "Gotham-Bold"
}

enum FontLevel {
    /// Pretendard
    case h1_kr_bold
    case regular_kr_semibold
    case regular_kr
    case regular_kr2
    case regular_kr3
    case medium_kr
    case small_kr
    case small_kr2
    
    /// Gotham
    case h1_en_bold
    case h2_en_bold
    case h3_en_bold
    case regular_en_bold
    case regular_en
    case regular_en2
    case medium_en
    case medium_en2
    case medium_en3
    case medium_en4
}

extension FontLevel {
    
    var fontWeight: String {
        switch self {
        case .h1_kr_bold:
            return PretendardType.B.rawValue
        case .regular_kr_semibold, .small_kr:
            return PretendardType.SB.rawValue
        case .regular_kr, .regular_kr2, .regular_kr3:
            return PretendardType.R.rawValue
        case .medium_kr, .small_kr2:
            return PretendardType.M.rawValue
        case .h1_en_bold, .h2_en_bold, .h3_en_bold, .regular_en_bold:
            return GothamType.B.rawValue
        case .regular_en, .regular_en2:
            return GothamType.R.rawValue
        case .medium_en, .medium_en2, .medium_en3, .medium_en4:
            return GothamType.M.rawValue
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .h1_en_bold:
            return 41
        case .h1_kr_bold, .medium_en4:
            return 21
        case .h2_en_bold:
            return 17
        case .h3_en_bold:
            return 15
        case .regular_kr3, .regular_en2, .medium_en2, .medium_en3:
            return 13
        case .regular_kr_semibold, .regular_kr, .regular_kr2, .medium_kr, .regular_en_bold, .regular_en, .medium_en:
            return 11
        case .small_kr:
            return 10
        case .small_kr2:
            return 9
        }
    }
}

extension UIFont {
    
    static func font(_ fontLevel: FontLevel) -> UIFont {
        guard let font = UIFont(name: fontLevel.fontWeight, size: fontLevel.fontSize)
        else { return UIFont.systemFont(ofSize: fontLevel.fontSize) }
        return font
    }
}
