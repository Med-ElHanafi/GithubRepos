//
//  AvatarView.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import Kingfisher
import SwiftUI

struct UserAvatarView: View {

    private let imageUrl: String
    private let imageStyleSize: ImageStyleSize

    var body: some View {
        createAvatar()
    }

    @ViewBuilder private func createAvatar() -> some View {
        VStack {
            KFImage(url)
                .cancelOnDisappear(true)
                .onFailure { _ in }
                .placeholder {
                    Image
                        .avatarPlaceHolder
                        .circleImageViewModifier(size: imageStyleSize)
                }
                .circleImageViewModifier(size: imageStyleSize)
        }
    }
    
    private var url: URL? {
        URL(string: imageUrl)
    }
}
