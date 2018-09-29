import XCTest
@testable import GitHubAPICommand

final class GitHubHostTest: XCTestCase {

    func testGitHubHostEnterprise() {
        let host = GitHubAPICommand.Host.enterprise(host: "https://enterprise.github.com")
        XCTAssertEqual(host.value, "https://enterprise.github.com")
    }
    
    func testGitHubHost() {
        let host = GitHubAPICommand.Host.github
        XCTAssertEqual(host.value, "https://api.github.com")
    }
}
