import XCTest
@testable import GitHubAPICommand

final class GitHubAPICommandTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(GitHubAPICommand().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
