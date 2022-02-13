//
//  RepositoryAPIModel.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 11/2/2022.
//

import Foundation

// MARK: - RepositoryAPIModel
class RepositoryAPIModel: Codable {
    public let totalCount: Int
    public let incompleteResults: Bool
    public let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }

    init(
        totalCount: Int,
        incompleteResults: Bool,
        items: [Repository]
    ) {
        self.totalCount = totalCount
        self.incompleteResults = incompleteResults
        self.items = items
    }
}
