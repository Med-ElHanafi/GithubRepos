//
//  RepositoryAPIModel+TestData.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation
@testable import GithubRepos

extension RepositoryAPIModel {
    static func testData(items: [Repository] = [Repository.testData()]) -> RepositoryAPIModel {
        RepositoryAPIModel(totalCount: 1, incompleteResults: false, items: items)
    }
}
