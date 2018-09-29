//
//  GitHubAuthor.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/9.
//

import Foundation
import ObjectMapper

public struct GitHubAuthor: GitHubAPIResponse {
    public fileprivate(set) var login: String?
    public fileprivate(set) var id: Int?
    public fileprivate(set) var avatarUrl: String?
    public fileprivate(set) var gravatarId: String?
    public fileprivate(set) var url: String?
    public fileprivate(set) var htmlUrl: String?
    public fileprivate(set) var followersUrl: String?
    public fileprivate(set) var followingUrl: String?
    public fileprivate(set) var gistsUrl: String?
    public fileprivate(set) var starredUrl: String?
    public fileprivate(set) var subscriptionsUrl: String?
    public fileprivate(set) var organizationsUrl: String?
    public fileprivate(set) var reposUrl: String?
    public fileprivate(set) var eventsUrl: String?
    public fileprivate(set) var receivedEventsUrl: String?
    public fileprivate(set) var type: String?
    public fileprivate(set) var siteAdmin: Bool?
    
    public init?(map: Map) {
        // NO-OP
    }
    
    public mutating func mapping(map: Map) {
        login <- map["login"]
        id <- map["id"]
        avatarUrl <- map["avatar_url"]
        gravatarId <- map["gravatar_id"]
        url <- map["url"]
        htmlUrl <- map["html_url"]
        followersUrl <- map["followers_url"]
        followingUrl <- map["following_url"]
        gistsUrl <- map["gists_url"]
        starredUrl <- map["starred_url"]
        subscriptionsUrl <- map["subscriptions_url"]
        organizationsUrl <- map["organizations_url"]
        reposUrl <- map["repos_url"]
        eventsUrl <- map["events_url"]
        receivedEventsUrl <- map["received_events_url"]
        type <- map["type"]
        siteAdmin <- map["site_admin"]
    }
}
