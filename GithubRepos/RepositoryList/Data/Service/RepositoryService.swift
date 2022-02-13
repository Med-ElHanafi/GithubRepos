//
//  RepositoryService.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation
import Combine

protocol RepositoryServicing {
    var apiSession: APIServicing { get }
    
    func getRepositoryList() -> AnyPublisher<RepositoryAPIModel, APIError>
}

final class RepositoryService: RepositoryServicing {
    let apiSession: APIServicing
    let queue: DispatchQueue
    
    init(
        apiSession: APIServicing,
        queue: DispatchQueue = .main
    ) {
        self.apiSession = apiSession
        self.queue = queue
    }
    
    func getRepositoryList() -> AnyPublisher<RepositoryAPIModel, APIError> {
        apiSession.request(with: RepositoryEndpoint.repoSwift, queue: queue)
            .eraseToAnyPublisher()
    }
}
