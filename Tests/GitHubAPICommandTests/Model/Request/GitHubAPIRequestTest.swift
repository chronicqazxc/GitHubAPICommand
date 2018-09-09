import XCTest
@testable import GitHubAPICommand

final class GitHubAPIRequestTest: XCTestCase {
    
    let arguments = [
        "Action":"actionValue",
        "Token":"tokenValue",
        "Orginization":"orginizationValue",
        "Repository":"repositoryValue",
        "Host":"hostValue",
        "InstallationID":"installationIDValue",
        "Addition":"AdditionValue"
    ]
    
    func testGitHubAPIRequestCount() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request.count, 7)
    }
    
    func testGitHubAPIRequestKeyValue() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request["Addition"], "AdditionValue")
    }
    
    func testGitHubAPIRequestAction() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request.action?.value, "actionValue")
    }
    
    func testGitHubAPIRequestToken() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request.token?.value, "tokenValue")
    }
    
    func testGitHubAPIRequestOrginization() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request.orginization?.value, "orginizationValue")
    }
    
    func testGitHubAPIRequestRepository() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request.repository?.value, "repositoryValue")
    }
    
    func testGitHubAPIRequestHost() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request.host?.value, "hostValue")
    }
    
    func testGitHubAPIInstallationID() {
        let request = GitHubAPIRequest.init(arguments: arguments)
        XCTAssertEqual(request.installationID?.value, "installationIDValue")
    }
}
