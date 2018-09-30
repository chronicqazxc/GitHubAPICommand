//
//  GitHubAPIRequest+Reference.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/23.
//

import Foundation

public protocol CreateRefereneceRequest: BasicRequest {
    var referenece: GitHubAPIArgument.Reference { get }
    var sha: GitHubAPIArgument.Reference { get }
}

extension GitHubAPIRequestFactory {

    public struct CreateReference: CreateRefereneceRequest {
        
        public private(set) var orginization: GitHubAPIArgument
        
        public private(set) var repository: GitHubAPIArgument
        
        public private(set) var action: GitHubAPIArgument
        
        public private(set) var token: GitHubAPIArgument
        
        public private(set) var installationID: GitHubAPIArgument
        
        public private(set) var host: GitHubAPIArgument?
        
        public private(set) var referenece: GitHubAPIArgument.Reference
        
        public private(set) var sha: GitHubAPIArgument.Reference
        
        public init(orginization: GitHubAPIArgument,
                    repository: GitHubAPIArgument,
                    action: GitHubAPIArgument,
                    token: GitHubAPIArgument,
                    installationID: GitHubAPIArgument,
                    host: GitHubAPIArgument? = nil,
                    referenece: GitHubAPIArgument.Reference,
                    sha: GitHubAPIArgument.Reference) {
            self.orginization = orginization
            self.repository = repository
            self.action = action
            self.token = token
            self.installationID = installationID
            self.host = host
            self.referenece = referenece
            self.sha = sha
        }
    }
}


