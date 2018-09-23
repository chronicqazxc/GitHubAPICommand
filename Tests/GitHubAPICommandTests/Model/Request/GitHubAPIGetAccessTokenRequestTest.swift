import XCTest
@testable import GitHubAPICommand

final class GitHubAPIGetAccessTokenRequestTest: XCTestCase {
    
    var request: GitHubAPIRequestFactory.GetAccessToken {
        let arguments = [
            "Action":"actionValue",
            "Token":"tokenValue",
            "Orginization":"orginizationValue",
            "Repository":"repositoryValue",
            "Host":"hostValue",
            "InstallationID":"installationIDValue",
            "Addition":"AdditionValue"
        ]
        
        return GitHubAPIRequestFactory.GetAccessToken(
            action: GitHubAPIArgument.action(arguments["Action"]!),
            token: GitHubAPIArgument.token(arguments["Token"]!),
            host: GitHubAPIArgument.host(arguments["Host"]!),
            installationID: GitHubAPIArgument.installationID(arguments["InstallationID"]!))
    }
    
    func testGitHubAPIRequestAction() {
        XCTAssertEqual(request.action.value, "actionValue")
    }
    
    func testGitHubAPIRequestToken() {
        XCTAssertEqual(request.token.value, "tokenValue")
    }
    
    func testGitHubAPIRequestHost() {
        XCTAssertEqual(request.host?.value, "hostValue")
    }
    
    func testGitHubAPIInstallationID() {
        XCTAssertEqual(request.installationID.value, "installationIDValue")
    }
}
