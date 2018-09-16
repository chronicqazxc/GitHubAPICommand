//
//  GitHubAPIRequest.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/6.
//

import Foundation

public protocol Request {
    var action: GitHubAPIArgument? { get }
    var token: GitHubAPIArgument? { get }
    var orginization: GitHubAPIArgument? { get }
    var repository: GitHubAPIArgument? { get }
    var host: GitHubAPIArgument? { get }
    var installationID: GitHubAPIArgument? { get }
    init(action: GitHubAPIArgument,
         token: GitHubAPIArgument,
         orginization: GitHubAPIArgument,
         repository: GitHubAPIArgument,
         host: GitHubAPIArgument,
         installationID: GitHubAPIArgument,
         additions: [AnyHashable: Any]?)
}

public typealias CompleteHandler = (GitHubAPIResponse?, Error?)->Void

public struct GitHubAPIRequest: Request {
    
    public private(set) var action: GitHubAPIArgument?
    
    public private(set) var token: GitHubAPIArgument?
    
    public private(set) var orginization: GitHubAPIArgument?
    
    public private(set) var repository: GitHubAPIArgument?
    
    public private(set) var host: GitHubAPIArgument?
    
    public private(set) var installationID: GitHubAPIArgument?
    
    private(set) var additions: [AnyHashable: Any]
    
    public init(action: GitHubAPIArgument,
                token: GitHubAPIArgument,
                orginization: GitHubAPIArgument,
                repository: GitHubAPIArgument,
                host: GitHubAPIArgument,
                installationID: GitHubAPIArgument,
                additions: [AnyHashable: Any]? = nil) {
        self.action = action
        self.token = token
        self.orginization = orginization
        self.repository = repository
        self.host = host
        self.installationID = installationID
        self.additions = additions ?? [:]
    }
}
