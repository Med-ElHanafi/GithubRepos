//
//  CardContainerView.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 14/2/2022.
//

import SwiftUI

struct CardContainerView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.highlight)
            content
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 16)
        .shadow(radius: 2)
    }
}
