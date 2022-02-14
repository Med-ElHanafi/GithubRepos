//
//  RepositoryView.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import SwiftUI

struct RepositoryView: View {
    let viewModel: RepositoryViewModel
    
    var body: some View {
        HStack {
            AvatarView(imageUrl: viewModel.avatarURL, imageStyleSize: .small)
                .padding(8)
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.repositoryName)
                    .font(.body)
                    .foregroundColor(.primary)
                Text(viewModel.ownerName)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}
