//
//  RepositoryViewModelFactory.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation

protocol RepositoryViewModelManufacturing {
    func make(from repository: Repository) -> RepositoryViewModel
    func makePlaceholders(upTo count: Int) -> [RepositoryViewModel]
    func makePlaceholder() -> RepositoryViewModel
}
final class RepositoryViewModelFactory: RepositoryViewModelManufacturing {
    func make(from repository: Repository) -> RepositoryViewModel {
        RepositoryViewModel(
            id: repository.id,
            avatarURL: repository.owner.avatarURL,
            ownerName: repository.owner.login,
            repositoryName: repository.fullName,
            createdAt: repository.createdAt,
            description: repository.description ?? "",
            forks: repository.forksCount,
            stars: repository.starCount,
            ownerType: repository.owner.type,
            ownerURL: repository.owner.url
        )
    }
    
    func makePlaceholders(upTo count: Int) -> [RepositoryViewModel] {
        (0...count).map {
            RepositoryViewModel(
                id: $0,
                avatarURL: "",
                ownerName: "ownerName",
                repositoryName: "repositoryName",
                createdAt: "createdAt",
                description: "description",
                forks: 0,
                stars: 0,
                ownerType: "ownerType",
                ownerURL: "ownerURL"
            )
        }
    }
    
    func makePlaceholder() -> RepositoryViewModel {
        RepositoryViewModel(
            id: 0,
            avatarURL: "",
            ownerName: "ownerName",
            repositoryName: "repositoryName",
            createdAt: "createdAt",
            description: "description",
            forks: 0,
            stars: 0,
            ownerType: "ownerType",
            ownerURL: "ownerURL"
        )
    }
}
