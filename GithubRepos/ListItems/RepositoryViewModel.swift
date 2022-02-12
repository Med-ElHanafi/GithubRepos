//
//  RepositoryViewModel.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation

struct RepositoryViewModel {
    let id: Int
    let avatarURL: String
    let ownerName: String
    let repositoryName: String
}

extension RepositoryViewModel: Equatable {
    static func == (lhs: RepositoryViewModel, rhs: RepositoryViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension RepositoryViewModel: Identifiable {}
