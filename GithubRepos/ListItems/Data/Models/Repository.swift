//
//  Repository.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 11/2/2022.
//

import Foundation

// MARK: - Repository
class Repository: Codable {
    let id: Int
    let name: String
    let fullName: String
    let description: String?
    let createdAt: String
    let updatedAt: String
    let pushedAt: String
    let topics: [String]
    let forksCount: Int
    let starCount: Int
    let cloneURL: String
    let openIssues: Int
    let language: String
    let watchers: Int
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case description
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case topics
        case forksCount = "forks_count"
        case starCount = "stargazers_count"
        case cloneURL = "clone_url"
        case openIssues = "open_issues"
        case language
        case watchers
        case owner
    }
    
    init(
        id: Int,
        name: String,
        fullName: String,
        description: String,
        createdAt: String,
        updatedAt: String,
        pushedAt: String,
        topics: [String],
        forksCount: Int,
        starCount: Int,
        cloneURL: String,
        openIssues: Int,
        language: String,
        watchers: Int,
        owner: Owner
    ) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.description = description
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pushedAt = pushedAt
        self.topics = topics
        self.forksCount = forksCount
        self.starCount = starCount
        self.cloneURL = cloneURL
        self.openIssues = openIssues
        self.language = language
        self.watchers = watchers
        self.owner = owner
    }
}
