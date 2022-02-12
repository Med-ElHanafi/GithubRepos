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
        VStack {
            Text(viewModel.repositoryName)
            Text(viewModel.ownerName)
            Text(viewModel.avatarURL)
        }
    }
}
