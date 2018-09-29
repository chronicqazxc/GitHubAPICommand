//
//  Host.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/5.
//

import Foundation

public enum Host {
    case github
    case enterprise(host: String)
    
    var value: String {
        switch self {
        case .github:
            return "https://api.github.com"
        case let .enterprise(host):
            return host
        }
    }
}
