//
//  MockAPIService.swift
//  GithubReposTests
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation
@testable import GithubRepos
import Combine

public final class MockAPIService: APIServicing {
    
    public var requestResultStub: Result<Any, APIError>?
    public var requestBuilderSpy: RequestBuilder?
    public var requestCallCount = 0
    
    public func request<T>(
        with builder: RequestBuilder,
        queue: DispatchQueue)
    -> AnyPublisher<T, APIError> where T : Decodable {
        requestBuilderSpy = builder
        requestCallCount += 1
        if let result = requestResultStub {
            switch result {
            case let .failure(error):
                return Result.failure(error).publisher.eraseToAnyPublisher()
            case let .success(success):
                return Result.success(success as! T).publisher.eraseToAnyPublisher()
            }
        }
        return Result.failure(.unknown).publisher.eraseToAnyPublisher()
    }
}
