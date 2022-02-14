//
//  RepositoryDetailView.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 13/2/2022.
//

import SwiftUI
import Kingfisher

struct RepositoryDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: RepositoryViewModel
    
    var body: some View {
        createBody()
    }
}

extension RepositoryDetailView {
    @ViewBuilder func createBody() -> some View {
        VStack {
            titleText()
            createList()
        }
    }
    
    @ViewBuilder func titleText() -> some View {
        Text("Repository details")
            .bold()
            .padding()
    }
    
    @ViewBuilder func createOwnerDetails() -> some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    LabelStackView(description: "Owner:", body: viewModel.ownerName)
                    LabelStackView(description: "Github:", body: viewModel.ownerURL)
                    LabelStackView(description: "Type:", body: viewModel.ownerType)
                }
            }
        }
    }
    
    @ViewBuilder func createRepoDetails() -> some View {
            VStack {
                VStack(alignment: .leading) {
                    LabelStackView(description: "Repo name:", body: viewModel.repositoryName)
                    LabelStackView(description: "Created at:", body: viewModel.createdAt)
                    LabelStackView(description: "Description:", body: viewModel.description)
                    
                }
                
                HStack {
                    HStack {
                        Image(systemName: "star")
                        Text(String(viewModel.stars))
                    }
                    HStack {
                        Image(systemName: "tuningfork")
                        Text(String(viewModel.forks))
                    }
                }
            }
    }
    
    @ViewBuilder func createAvatarView() -> some View {
        HStack {
            Spacer()
            AvatarView(imageUrl: viewModel.avatarURL, imageStyleSize: .mediumLarge)
                .padding(8)
            Spacer()
        }
    }
    
    @ViewBuilder func createList() -> some View {
        List {
            createAvatarView()
            createOwnerDetails()
            createRepoDetails()
        }
    }
}
