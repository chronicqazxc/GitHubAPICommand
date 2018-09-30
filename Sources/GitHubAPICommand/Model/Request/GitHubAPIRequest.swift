//
//  GitHubAPIRequest.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/6.
//

import Foundation

public protocol Request {
    var action: GitHubAPIArgument { get }
    var token: GitHubAPIArgument { get }
    var host: GitHubAPIArgument? { get }
    var installationID: GitHubAPIArgument { get }
}

public protocol BasicRequest: Request {
    var orginization: GitHubAPIArgument { get }
    var repository: GitHubAPIArgument { get }
}

public typealias CompleteHandler = (GitHubAPIResponse?, Error?)->Void

public struct GitHubAPIRequestFactory {
    
    public struct GetAccessToken: Request {
        public private(set) var action: GitHubAPIArgument
        
        public private(set) var token: GitHubAPIArgument
        
        public private(set) var host: GitHubAPIArgument?
        
        public private(set) var installationID: GitHubAPIArgument
        
        public init(action: GitHubAPIArgument,
                    token: GitHubAPIArgument,
                    host: GitHubAPIArgument? = nil,
                    installationID: GitHubAPIArgument) {
            self.action = action
            self.token = token
            self.host = host
            self.installationID = installationID
        }
    }
}
