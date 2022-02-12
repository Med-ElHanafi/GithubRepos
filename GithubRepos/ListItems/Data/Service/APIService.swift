//
//  APIService.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation
import Combine

protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

protocol APIServicing {
    func request<T: Decodable>(
        with builder: RequestBuilder,
        queue: DispatchQueue
    ) -> AnyPublisher<T, APIError>
}

final class APIService: APIServicing {
    func request<T>(
        with builder: RequestBuilder,
        queue: DispatchQueue = .main
    ) -> AnyPublisher<T, APIError> where T: Decodable {
        URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: queue)
            .mapError { _ in .unknown}
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        return Just(data)
                            .decode(type: T.self, decoder: JSONDecoder())
                            .mapError {_ in .decodingError}
                            .eraseToAnyPublisher()
                    } else {
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
        
            .eraseToAnyPublisher()
    }
}

