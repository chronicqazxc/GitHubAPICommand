//
//  GitHubReleaseRequest.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/15.
//

import Foundation

public protocol ReleaseRequest: Request {
    var releaseName: GitHubAPIArgument.Release? { get }
    var releaseBody: GitHubAPIArgument.Release? { get }
    var releaseTag: GitHubAPIArgument.Release? { get }
    var releaseCommitish: GitHubAPIArgument.Release? { get }
    init(action: GitHubAPIArgument,
         token: GitHubAPIArgument,
         orginization: GitHubAPIArgument,
         repository: GitHubAPIArgument,
         host: GitHubAPIArgument,
         installationID: GitHubAPIArgument,
         releaseName: GitHubAPIArgument.Release,
         releaseBody: GitHubAPIArgument.Release,
         releaseTag: GitHubAPIArgument.Release,
         releaseCommitish: GitHubAPIArgument.Release)
}

extension GitHubAPIRequest: ReleaseRequest {

    public var releaseName: GitHubAPIArgument.Release? {
        get {
            guard let name = additions[GitHubAPIArgumentKey.Release.name] as? GitHubAPIArgument.Release else {
                return nil
            }
            return name
        }
    }
    
    public var releaseBody: GitHubAPIArgument.Release? {
        get {
            guard let body = additions[GitHubAPIArgumentKey.Release.body] as? GitHubAPIArgument.Release else {
                return nil
            }
            return body
        }
    }
    
    public var releaseTag: GitHubAPIArgument.Release? {
        get {
            guard let tag = additions[GitHubAPIArgumentKey.Release.tag] as? GitHubAPIArgument.Release else {
                return nil
            }
            return tag
        }
    }
    
    public var releaseCommitish: GitHubAPIArgument.Release? {
        get {
            guard let commitish = additions[GitHubAPIArgumentKey.Release.commitish] as? GitHubAPIArgument.Release else {
                return nil
            }
            return commitish
        }
    }
    
    public init(action: GitHubAPIArgument,
                token: GitHubAPIArgument,
                orginization: GitHubAPIArgument,
                repository: GitHubAPIArgument,
                host: GitHubAPIArgument,
                installationID: GitHubAPIArgument,
                releaseName: GitHubAPIArgument.Release,
                releaseBody: GitHubAPIArgument.Release,
                releaseTag: GitHubAPIArgument.Release,
                releaseCommitish: GitHubAPIArgument.Release) {
        
        self.init(action: action,
                  token: token,
                  orginization: orginization,
                  repository: repository,
                  host: host,
                  installationID: installationID,
                  additions: [
                    GitHubAPIArgumentKey.Release.name : releaseName,
                    GitHubAPIArgumentKey.Release.body : releaseBody,
                    GitHubAPIArgumentKey.Release.tag : releaseTag,
                    GitHubAPIArgumentKey.Release.commitish : releaseCommitish
            ])
    }
}
