//
//  MockRepositoryViewModelFactory.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import Foundation
@testable import GithubRepos

final class MockRepositoryViewModelFactory: RepositoryViewModelManufacturing {
    
    var makeFromCallCount = 0
    var makeFromRepositorySpy: Repository?
    var makeFromResultStub: RepositoryViewModel?
    
    func make(from repository: Repository) -> RepositoryViewModel {
        makeFromCallCount += 1
        makeFromRepositorySpy = repository
        
        return makeFromResultStub ?? RepositoryViewModelFactory().make(from: repository)
    }

    var makePlaceholdersUpToCallCount = 0
    var makePlaceholdersUpToCountSpy: Int?
    var makePlaceholdersResultStub: [RepositoryViewModel]?
    
    func makePlaceholders(upTo count: Int) -> [RepositoryViewModel] {
        makePlaceholdersUpToCallCount += 1
        makePlaceholdersUpToCountSpy = count
        
        return makePlaceholdersResultStub ?? RepositoryViewModelFactory().makePlaceholders(upTo: count)
    }
    
    var makePlaceholderCallCount = 0
    var makePlaceholderResultStub: RepositoryViewModel?
    func makePlaceholder() -> RepositoryViewModel {
        makePlaceholderCallCount += 1
        return makePlaceholderResultStub ?? RepositoryViewModelFactory().makePlaceholder()
    }
}
