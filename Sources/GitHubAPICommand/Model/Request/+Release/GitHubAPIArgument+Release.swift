//
//  GitHubAPIArgument+Release.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/15.
//

import Foundation

extension GitHubAPIArgumentKey {
    public enum Release {
        public static let name = "ReleaseName"
        public static let body = "ReleaseBody"
        public static let tag = "ReleaseTag"
        public static let commitish = "ReleaseCommitish"
    }
}

extension GitHubAPIArgument {
    public enum Release {
        case name(String)
        case body(String)
        case tag(String)
        case commitish(String)
        
        var value: String {
            get {
                switch self {
                case let .name(value):
                    return value
                case let .body(value):
                    return value
                case let .tag(value):
                    return value
                case let .commitish(value):
                    return value
                }
            }
        }
        
        func description() -> String {
            switch self {
            case .name:
                return "Release Name"
            case .body:
                return "Release Body"
            case .tag:
                return "Release Tag"
            case .commitish:
                return "Release Commitish"
            }
        }
    }
}
