//
//  Owner+TestData.swift
//  GithubReposTesting
//
//  Created by Mohamed El hanafi on 12/2/2022.
//

import Foundation
@testable import GithubRepos

extension Owner {
    static func testData(
        login: String = "test owner",
        id: Int = 0)
    -> Owner {
        Owner(login: login, id: id, nodeID: "", avatarURL: "", gravatarID: "", url: "", htmlURL: "", followersURL: "", followingURL: "", gistsURL: "", starredURL: "", subscriptionsURL: "", organizationsURL: "", reposURL: "", eventsURL: "", receivedEventsURL: "", siteAdmin: false)
    }
}
