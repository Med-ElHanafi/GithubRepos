//
//  ImageStyleSize.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import SwiftUI

public enum ImageStyleSize: CGFloat {
    case small = 64
    case medium = 104
    case mediumLarge = 128
    case large = 160
}

extension ImageStyleSize {
    public var cornerRadius: CGFloat {
        switch self {
        case .small:
            return 3
        case .medium, .mediumLarge:
            return 4
        case .large:
            return 6
        }
    }
    
    public var circularImageSize: CGFloat {
        switch self {
        case .small:
            return 42
        case .medium, .mediumLarge:
            return 72
        case .large:
            return 112
        }
    }
}
