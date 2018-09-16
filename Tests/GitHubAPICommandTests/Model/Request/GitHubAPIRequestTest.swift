import XCTest
@testable import GitHubAPICommand

final class GitHubAPIRequestTest: XCTestCase {
    
    var request: GitHubAPIRequest {
        let arguments = [
            "Action":"actionValue",
            "Token":"tokenValue",
            "Orginization":"orginizationValue",
            "Repository":"repositoryValue",
            "Host":"hostValue",
            "InstallationID":"installationIDValue",
            "Addition":"AdditionValue"
        ]
        return GitHubAPIRequest(action: GitHubAPIArgument.action(arguments["Action"]!),
                                token: GitHubAPIArgument.token(arguments["Token"]!),
                                orginization: GitHubAPIArgument.orginization(arguments["Orginization"]!),
                                repository: GitHubAPIArgument.repository(arguments["Repository"]!),
                                host: GitHubAPIArgument.host(arguments["Host"]!),
                                installationID: GitHubAPIArgument.installationID(arguments["InstallationID"]!))
    }
    
    func testGitHubAPIRequestAction() {
        XCTAssertEqual(request.action?.value, "actionValue")
    }
    
    func testGitHubAPIRequestToken() {
        XCTAssertEqual(request.token?.value, "tokenValue")
    }
    
    func testGitHubAPIRequestOrginization() {
        XCTAssertEqual(request.orginization?.value, "orginizationValue")
    }
    
    func testGitHubAPIRequestRepository() {
        XCTAssertEqual(request.repository?.value, "repositoryValue")
    }
    
    func testGitHubAPIRequestHost() {
        XCTAssertEqual(request.host?.value, "hostValue")
    }
    
    func testGitHubAPIInstallationID() {
        XCTAssertEqual(request.installationID?.value, "installationIDValue")
    }
}
