//
//  Formatter+.swift
//  GitHubAPICommandPackageTests
//
//  Created by Wayne Hsiao on 2018/9/5.
//

import Foundation

extension DateFormatter {
    var gitHubAPIFormatter: DateFormatter {
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        self.timeZone = TimeZone.current
        return self
    }
}
