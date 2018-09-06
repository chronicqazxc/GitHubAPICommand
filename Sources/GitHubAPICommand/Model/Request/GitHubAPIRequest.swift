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
}

public typealias CompleteHandler = (GitHubAPIResponse?, Error?)->Void

public struct GitHubAPIRequest: Request {
    
    fileprivate let arguments: [AnyHashable: String]
    
    public init(arguments: [AnyHashable: String]) {
        self.arguments = arguments
    }
    
    public var count: Int {
        get {
            return arguments.keys.count
        }
    }
    
    public subscript(key: String) -> String? {
        get {
            return arguments[key]
        }
    }
    
    public var action: GitHubAPIArgument? {
        guard let actionValue = self[GitHubAPIArgumentKey.action] else {
            return nil
        }
        return GitHubAPIArgument.action(actionValue)
    }
    
    public var token: GitHubAPIArgument? {
        guard let tokenValue = self[GitHubAPIArgumentKey.token] else {
            return nil
        }
        return GitHubAPIArgument.token(tokenValue)
    }
    
    public var orginization: GitHubAPIArgument? {
        guard let orginizationValue = self[GitHubAPIArgumentKey.orginization] else {
            return nil
        }
        return GitHubAPIArgument.orginization(orginizationValue)
    }
    
    public var repository: GitHubAPIArgument? {
        guard let repositoryValue = self[GitHubAPIArgumentKey.repository] else {
            return nil
        }
        return GitHubAPIArgument.repository(repositoryValue)
    }
    
    public var host: GitHubAPIArgument? {
        let hostValue = self[GitHubAPIArgumentKey.host]
        return GitHubAPIArgument.host(hostValue)
    }
    
    public var installationID: GitHubAPIArgument? {
        guard let installationIDValue = self[GitHubAPIArgumentKey.installationID] else {
            return nil
        }
        return GitHubAPIArgument.installationID(installationIDValue)
    }
}
