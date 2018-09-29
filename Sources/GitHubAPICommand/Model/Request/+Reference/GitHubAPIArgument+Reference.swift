//
//  GitHubAPIArgument+Reference.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/23.
//

import Foundation

extension GitHubAPIArgumentKey {
    public enum Reference {
        public static let reference = "Reference"
        public static let sha = "Sha"
    }
}

extension GitHubAPIArgument {
    public enum Reference {
        case referenece(String)
        case sha(String)
        
        var value: String {
            get {
                switch self {
                case let .referenece(value):
                    return value
                case let .sha(value):
                    return value
                }
            }
        }
        
        func description() -> String {
            switch self {
            case .referenece:
                return "The name of the fully qualified reference(ie: refs/tags/v0.0.1)"
            case .sha:
                return "The SHA1 value for this reference."
            }
        }
    }
}
