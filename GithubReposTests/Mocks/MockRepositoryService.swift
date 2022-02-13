//
//  MockRepositoryService.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import Foundation
@testable import GithubRepos
import Combine

final class MockRepositoryService: RepositoryServicing {
    var apiSession: APIServicing
    
    init(apiSession: APIServicing = MockAPIService()) {
        self.apiSession = apiSession
    }
    
    var resultStub: Result<RepositoryAPIModel, APIError>?
    var getRepositoryListCallCount = 0
    
    func getRepositoryList() -> AnyPublisher<RepositoryAPIModel, APIError> {
        if let resultStub = resultStub {
            switch resultStub {
            case let .failure(error):
                return Result.failure(error).publisher.eraseToAnyPublisher()
            case let .success(success):
                return Result.success(success).publisher.eraseToAnyPublisher()
            }
        }
        return apiSession.request(with: RepositoryEndpoint.repoSwift, queue: .main)
            .eraseToAnyPublisher()
    }
}
