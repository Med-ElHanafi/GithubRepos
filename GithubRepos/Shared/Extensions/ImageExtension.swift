//
//  ImageExtension.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import SwiftUI

extension Image {
    static let avatarPlaceHolder = Image("placeholder_owner")
}

extension Image {
    func rectangleImageViewModifier() -> some View {
        return resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .overlay(Rectangle().stroke(Color.primary.opacity(0.15), lineWidth: 0.5))
    }

    func circleImageViewModifier(size: ImageStyleSize) -> some View {
        return resizable()
            .renderingMode(.original)
            .frame(width: size.rawValue, height: size.rawValue)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.primary.opacity(0.15), lineWidth: 0.5))
    }
}
