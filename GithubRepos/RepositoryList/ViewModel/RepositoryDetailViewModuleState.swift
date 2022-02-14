//
//  RepositoryDetailViewModuleState.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import Foundation

class RepositoryDetailViewModuleState: ObservableObject {
    @Published var viewModel: RepositoryViewModel
    
    init(viewModel: RepositoryViewModel) {
        self.viewModel = viewModel
    }
}
