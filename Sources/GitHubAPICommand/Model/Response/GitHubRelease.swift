//
//  GitHubRelease.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/9.
//

import Foundation
import ObjectMapper

public struct GitHubRelease: GitHubAPIResponse {
    
    public fileprivate(set) var author: GitHubAuthor?
    public fileprivate(set) var assetsURL: String?
    public fileprivate(set) var body: String?
    public fileprivate(set) var createdAt: Date?
    public fileprivate(set) var draft: Int?
    public fileprivate(set) var htmlUrl: String?
    public fileprivate(set) var id: Int?
    public fileprivate(set) var name: String?
    public fileprivate(set) var prerelease: Bool?
    public fileprivate(set) var publishedAt: Date?
    public fileprivate(set) var tagName: String?
    public fileprivate(set) var tarballUrl: String?
    public fileprivate(set) var targetCommitish: String?
    public fileprivate(set) var uploadUrl: String?
    public fileprivate(set) var url: String?
    public fileprivate(set) var zipballUrl: String?
    
    public init?(map: Map) {
        // NO-OP
    }
    
    public mutating func mapping(map: Map) {
        author <- map["author"]
        assetsURL <- map["assets_url"]
        body <- map["body"]
        if let expires_at = map["expires_at"].currentValue as? String,
            let date = DateFormatter().gitHubAPIFormatter.date(from: expires_at) {
            let plusEightDate = DateFormatter().gitHubAPIFormatter.string(from: date)
            createdAt = DateFormatter().gitHubAPIFormatter.date(from: plusEightDate)
        }
        draft <- map["draft"]
        htmlUrl <- map["html_url"]
        id <- map["id"]
        name <- map["name"]
        if let prereleaseValue = map["prerelease"].currentValue as? Int {
            prerelease = prereleaseValue == 1 ? true : false
        }
        if let published_at = map["published_at"].currentValue as? String,
            let date = DateFormatter().gitHubAPIFormatter.date(from: published_at) {
            let plusEightDate = DateFormatter().gitHubAPIFormatter.string(from: date)
            publishedAt = DateFormatter().gitHubAPIFormatter.date(from: plusEightDate)
        }
        tagName <- map["tag_name"]
        tarballUrl <- map["tarball_url"]
        targetCommitish <- map["target_commitish"]
        uploadUrl <- map["upload_url"]
        url <- map["url"]
        zipballUrl <- map["zipball_url"]
    }
}
