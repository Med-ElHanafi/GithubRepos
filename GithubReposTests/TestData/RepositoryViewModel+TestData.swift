//
//  RepositoryViewModel+TestData.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import Foundation
@testable import GithubRepos

extension RepositoryViewModel {
    static func testData(id: Int = 1, avatarURL: String = "", ownerName: String = "", repositoryName: String = "") -> RepositoryViewModel {
        RepositoryViewModel(id: id, avatarURL: avatarURL, ownerName: ownerName, repositoryName: repositoryName)
    }
}
