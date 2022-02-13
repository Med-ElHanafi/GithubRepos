//
//  KFImageExtension.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import SwiftUI
import Kingfisher

public extension KFImage {
    func circleImageViewModifier(size: ImageStyleSize) -> some View {
        return resizable()
            .frame(width: size.rawValue, height: size.rawValue)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.primary.opacity(0.15), lineWidth: 0.5))
    }
    func rectangleImageViewModifier() -> some View {
        return resizable()
            .aspectRatio(contentMode: .fill)
            .overlay(Rectangle().stroke(Color.primary.opacity(0.15), lineWidth: 0.5))
    }
}
