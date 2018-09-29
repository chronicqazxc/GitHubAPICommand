//
//  GitHubTag.swift
//  GitHubAPICommand
//
//  Created by Wayne Hsiao on 2018/9/20.
//

import Foundation
import ObjectMapper

public struct GitHubTagObject: GitHubAPIResponse {
    public fileprivate(set) var tag: String?
    public fileprivate(set) var sha: String?
    public fileprivate(set) var url: String?
    public fileprivate(set) var message: String?
    public fileprivate(set) var tagger: GitHubTagObject.GitHubTagger?
    public fileprivate(set) var object: GitHubTagObject.Object?
    public fileprivate(set) var verification: GitHubTagObject.Verification?

    public struct GitHubTagger: GitHubAPIResponse {
        public fileprivate(set) var name: String?
        public fileprivate(set) var email: String?
        public fileprivate(set) var date: Date?

        public init?(map: Map) {
            // NO-OP
        }

        public mutating func mapping(map: Map) {
            name <- map["name"]
            email <- map["email"]
            date <- map["date"]
            if let dateValue = map["date"].currentValue as? String,
                let formattedDate = DateFormatter().gitHubAPIFormatter.date(from: dateValue) {
                let dateString = DateFormatter().gitHubAPIFormatter.string(from: formattedDate)
                date = DateFormatter().gitHubAPIFormatter.date(from: dateString)
            }
        }
    }

    public struct Object: GitHubAPIResponse {
        public fileprivate(set) var type: String?
        public fileprivate(set) var sha: String?
        public fileprivate(set) var url: String?

        public init?(map: Map) {
            // NO-OP
        }
        public mutating func mapping(map: Map) {
            type <- map["type"]
            sha <- map["sha"]
            url <- map["url"]
        }
    }

    public struct Verification: GitHubAPIResponse {
        public fileprivate(set) var verified: Bool?
        public fileprivate(set) var reason: String?
        public fileprivate(set) var signature: String?
        public fileprivate(set) var payload: String?

        public init?(map: Map) {
            // NO-OP
        }
        public mutating func mapping(map: Map) {
            verified <- map["verified"]
            reason <- map["reason"]
            signature <- map["signature"]
            payload <- map["payload"]
        }
    }

    public init?(map: Map) {
        // NO-OP
    }

    public mutating func mapping(map: Map) {
        tag <- map["tag"]
        sha <- map["sha"]
        url <- map["url"]
        message <- map["message"]
        tagger <- map["tagger"]
        object <- map["object"]
        verification <- map["verification"]
    }
}
