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
            .font(.title)
            .padding()
    }
    
    @ViewBuilder func createOwnerDetails() -> some View {
        VStack {
            AvatarView(imageUrl: viewModel.avatarURL, imageStyleSize: .mediumLarge)
                .padding(8)
            CardContainerView {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        LabelStackView(description: "Owner:", body: viewModel.ownerName)
                        LabelStackView(description: "Github", body: viewModel.ownerURL)
                    }
                    Spacer()
                    Image(systemName: viewModel.ownerType == "User" ? "person" : "building.columns")
                        .padding()
                }
                .padding()
            }
        }
    }
    
    @ViewBuilder func createRepoDetails() -> some View {
        CardContainerView {
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
            .padding()
        }
    }
    
    @ViewBuilder func createList() -> some View {
        ScrollView {
            createOwnerDetails()
            createRepoDetails()
        }
    }
}
