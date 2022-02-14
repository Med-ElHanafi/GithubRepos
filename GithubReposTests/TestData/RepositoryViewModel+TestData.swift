//
//  RepositoryViewModel+TestData.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import Foundation
@testable import GithubRepos

extension RepositoryViewModel {
    static func testData(
        id: Int = 1,
        avatarURL: String = "",
        ownerName: String = "",
        repositoryName: String = "",
        createdAt: String = "",
        description: String = "",
        forks: Int = 0,
        stars: Int = 0,
        ownerType: String = "",
        ownerURL: String = ""
    ) -> RepositoryViewModel {
        RepositoryViewModel(
            id: id,
            avatarURL: avatarURL,
            ownerName: ownerName,
            repositoryName: repositoryName,
            createdAt: createdAt,
            description: description,
            forks: forks,
            stars: stars,
            ownerType: ownerType,
            ownerURL: ownerURL
        )
    }
}
