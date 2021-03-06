//
//  ListRepoModuleState.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation
import Combine

final class RepositoriesListModuleState: ObservableObject {
    enum State: Equatable {
        case loading([RepositoryViewModel])
        case success([RepositoryViewModel])
        case empty
    }
    
    @Published private(set) var state: State = .empty
    @Published var presentableViewModel: RepositoryViewModel
    
    let repositoryService: RepositoryServicing
    let viewModelFactory: RepositoryViewModelManufacturing
    private var cancellables = Set<AnyCancellable>()
    
    init(
        repositoryService: RepositoryServicing,
        viewModelFactory: RepositoryViewModelManufacturing
    ) {
        self.repositoryService = repositoryService
        self.viewModelFactory = viewModelFactory
        
        state = .loading(viewModelFactory.makePlaceholders(upTo: 10))
        presentableViewModel = viewModelFactory.makePlaceholder()
    }
    
    func getRepositories() {
        repositoryService.getRepositoryList()
            .map { $0.items }
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print("Handle error: \(error)")
                    self?.state = .empty
                case .finished:
                    break
                }
            } receiveValue: { [weak self] repositories in
                guard let self = self else { return }
                let viewModels = repositories.map {
                    self.viewModelFactory.make(from: $0)
                }
                self.state = .success(viewModels)
            }
            .store(in: &cancellables)
    }
}
