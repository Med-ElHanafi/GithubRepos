//
//  LabelStackView.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 14/2/2022.
//

import SwiftUI

struct LabelStackView: View {
    let descriptionText: String
    let bodyText: String
    
    init(
        description: String,
        body: String
    ) {
        self.descriptionText = description
        self.bodyText = body
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text(descriptionText)
                .font(.body)
                .foregroundColor(.secondary)
            Text(bodyText)
                .fixedSize(horizontal: false, vertical: true)
                .font(.body)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 8)
    }
}
