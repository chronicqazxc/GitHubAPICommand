//
//  GitHubAPIArgument.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/6.
//

import Foundation

public enum GitHubAPIArgumentKey {
    public static let token = "Token"
    public static let orginization = "Orginization"
    public static let repository = "Repository"
    public static let host = "Host"
    public static let installationID = "InstallationID"
    public static let action = "Action"
}

public enum GitHubAPIArgument {
    
    case action(String)
    case token(String)
    case orginization(String)
    case repository(String)
    case host(String?)
    case installationID(String)
    
    var value: String? {
        get {
            switch self {
            case let .action(value):
                return value
            case let .token(value):
                return value
            case let .orginization(value):
                return value
            case let .repository(value):
                return value
            case let .host(value):
                return value
            case let .installationID(value):
                return value
            }
        }
    }
    
    func description() -> String {
        switch self {
        case .action:
            return "Action"
        case .token:
            return "Token"
        case .orginization:
            return "Orginization"
        case .repository:
            return "Repository"
        case .host:
            return "Host"
        case .installationID:
            return "InstallationID"
        }
    }
}
