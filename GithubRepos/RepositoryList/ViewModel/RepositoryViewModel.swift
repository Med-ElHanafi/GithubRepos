//
//  RepositoryViewModel.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation

class RepositoryViewModel: ObservableObject {
    let id: Int
    let avatarURL: String
    let ownerName: String
    let repositoryName: String
    let createdAt: String
    let description: String
    let forks: Int
    let stars: Int
    let forksText: String
    let starsText: String
    let ownerType: String
    let ownerURL: String
    
    init(
        id: Int,
        avatarURL: String,
        ownerName: String,
        repositoryName: String,
        createdAt: String,
        description: String,
        forks: Int,
        stars: Int,
        ownerType: String,
        ownerURL: String
    ) {
        self.id = id
        self.avatarURL = avatarURL
        self.ownerName = ownerName
        self.repositoryName = repositoryName
        self.createdAt = createdAt.formatDateString
        self.description = description
        self.forks = forks
        self.stars = stars
        self.forksText = "Forks \(forks)"
        self.starsText = "Stars \(stars)"
        self.ownerType = ownerType
        self.ownerURL = ownerURL
    }
}

extension RepositoryViewModel: Equatable {
    static func == (lhs: RepositoryViewModel, rhs: RepositoryViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension RepositoryViewModel: Identifiable {}
