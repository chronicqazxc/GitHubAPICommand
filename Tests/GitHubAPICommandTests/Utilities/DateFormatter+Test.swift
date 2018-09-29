import XCTest
@testable import GitHubAPICommand

final class DateFormatter_Test: XCTestCase {
    func testGitHubAPIFormatterStringFromDate() {
        let gitHubAPIformatter = DateFormatter().gitHubAPIFormatter
        let current = Date()
        let date = gitHubAPIformatter.string(from: current)
        XCTAssertNotNil(date)
    }
    
    func testGitHubAPIFormatterDateFromString() {
        let gitHubAPIformatter = DateFormatter().gitHubAPIFormatter
        let date = "2018-09-05T20:37:31+0800"
        let formatted = gitHubAPIformatter.date(from: date)
        XCTAssertNotNil(formatted)
    }
}
