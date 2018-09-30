//
//  GitHubReleaseRequest.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/15.
//

import Foundation

public protocol ReleaseRequest: BasicRequest {
    var releaseName: GitHubAPIArgument.Release { get }
    var releaseBody: GitHubAPIArgument.Release { get }
    var releaseTag: GitHubAPIArgument.Release { get }
    var releaseCommitish: GitHubAPIArgument.Release { get }
}

public protocol GetLatestReleaseRequest: BasicRequest {
}

extension GitHubAPIRequestFactory {
    
    public struct GetLatestRelease: GetLatestReleaseRequest {
        
        public private(set) var action: GitHubAPIArgument
        
        public private(set) var token: GitHubAPIArgument
        
        public private(set) var installationID: GitHubAPIArgument
        
        public private(set) var orginization: GitHubAPIArgument
        
        public private(set) var repository: GitHubAPIArgument
        
        public private(set) var host: GitHubAPIArgument?
        
        public init(action: GitHubAPIArgument,
                    token: GitHubAPIArgument,
                    installationID: GitHubAPIArgument,
                    orginization: GitHubAPIArgument,
                    repository: GitHubAPIArgument,
                    host: GitHubAPIArgument? = nil) {
            self.action = action
            self.token = token
            self.installationID = installationID
            self.orginization = orginization
            self.repository = repository
            self.host = host
        }
    }
    
    public struct Release: ReleaseRequest {
        public private(set) var action: GitHubAPIArgument
        
        public private(set) var orginization: GitHubAPIArgument
        
        public private(set) var repository: GitHubAPIArgument
        
        public private(set) var token: GitHubAPIArgument
        
        public private(set) var installationID: GitHubAPIArgument
        
        public private(set) var host: GitHubAPIArgument?
        
        public private(set) var releaseName: GitHubAPIArgument.Release
        
        public private(set) var releaseBody: GitHubAPIArgument.Release
        
        public private(set) var releaseTag: GitHubAPIArgument.Release
        
        public private(set) var releaseCommitish: GitHubAPIArgument.Release
        
        public init(action: GitHubAPIArgument,
                    orginization: GitHubAPIArgument,
                    repository: GitHubAPIArgument,
                    token: GitHubAPIArgument,
                    installationID: GitHubAPIArgument,
                    host: GitHubAPIArgument? = nil,
                    releaseName: GitHubAPIArgument.Release,
                    releaseBody: GitHubAPIArgument.Release,
                    releaseTag: GitHubAPIArgument.Release,
                    releaseCommitish: GitHubAPIArgument.Release) {
            self.action = action
            self.orginization = orginization
            self.repository = repository
            self.token = token
            self.installationID = installationID
            self.host = host
            self.releaseName = releaseName
            self.releaseBody = releaseBody
            self.releaseTag = releaseTag
            self.releaseCommitish = releaseCommitish
        }
    }
}
