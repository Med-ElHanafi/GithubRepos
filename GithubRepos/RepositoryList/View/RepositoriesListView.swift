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
    @State private var showingSheet = false
    
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
        Text("Swift repositories")
            .bold()
    }
    
    @ViewBuilder func createList() -> some View {
        switch moduleState.state {
        case .empty:
            EmptyView()
        case let .loading(viewModels),
            let .success(viewModels):
            List(viewModels) { viewModel in
                RepositoryView(viewModel: viewModel)
                    .redacted(reason: moduleState.state == .loading(viewModels) ? .placeholder : [])
                    .onTapGesture {
                        moduleState.presentableViewModel = viewModel
                        showingSheet.toggle()
                    }
            }
            .sheet(isPresented: $showingSheet) {
                RepositoryDetailView(viewModel: moduleState.presentableViewModel)
            }
        }
    }
}
