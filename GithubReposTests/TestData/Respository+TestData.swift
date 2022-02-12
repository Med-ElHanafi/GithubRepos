//
//  Respository+TestData.swift
//  GithubReposTesting
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation
@testable import GithubRepos

extension Repository {
    static func testData(
        id: Int = 1,
        name: String = "repo",
        fullName: String = "test repo",
        owner: Owner = Owner.testData()
    ) -> Repository {
        Repository(id: id, name: name, fullName: fullName, description: "", createdAt: "", updatedAt: "", pushedAt: "", topics: [], forksCount: 1, starCount: 1, cloneURL: "", openIssues: 1, language: "", watchers: 1, owner: owner)
    }
}
