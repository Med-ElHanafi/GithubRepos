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
}
final class RepositoryViewModelFactory: RepositoryViewModelManufacturing {
    func make(from repository: Repository) -> RepositoryViewModel {
        RepositoryViewModel(
            id: repository.id,
            avatarURL: repository.owner.avatarURL,
            ownerName: repository.owner.login,
            repositoryName: repository.fullName
        )
    }
    
    func makePlaceholders(upTo count: Int) -> [RepositoryViewModel] {
        (0...count).map {
            RepositoryViewModel(
                id: $0,
                avatarURL: "",
                ownerName: "",
                repositoryName: ""
            )
        }
    }
}
