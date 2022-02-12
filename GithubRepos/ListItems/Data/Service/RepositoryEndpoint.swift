//
//  RepoEndpoint.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation

enum RepositoryEndpoint {
    case repoSwift
}

extension RepositoryEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .repoSwift:
            guard var components = URLComponents(string: "https://api.github.com/search/repositories") else {
                preconditionFailure("Invalid URL format")
            }
            components.queryItems = [URLQueryItem(name: "q", value: "language:swift")]
            let request = URLRequest(url: components.url!)
            return request
        }
    }
}
