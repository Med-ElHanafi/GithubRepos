//
//  ListItemsView.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 11/2/2022.
//

import Foundation
import SwiftUI

struct RepositoriesListView: View {
    @ObservedObject private var moduleState: RepositoriesListModuleState
    
    init(moduleState: RepositoriesListModuleState) {
        self.moduleState = moduleState
    }
    
    var body: some View {
        createBody()
            .onAppear {
                moduleState.getRepositories()
            }
    }
}

private extension RepositoriesListView {
    @ViewBuilder func createBody() -> some View {
        VStack {
            headerText()
            createList()
        }
    }
    
    @ViewBuilder func headerText() -> some View {
        Text("You can find swift repositories")
    }
    
    @ViewBuilder func createList() -> some View {
        switch moduleState.state {
        case .empty:
            EmptyView()
        case let .loading(viewModels),
            let .success(viewModels):
            ScrollView {
                ForEach(viewModels) { viewModel in
                    LazyVStack {
                        RepositoryView(viewModel: viewModel)
                    }
                }
            }
        }
    }
}