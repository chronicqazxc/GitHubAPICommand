import XCTest
@testable import GitHubAPICommand

final class GitHubAPIRequest_ReleaseTest: XCTestCase {
    
    var request: GitHubAPIRequest {
        let arguments = [
            "Action":"actionValue",
            "Token":"tokenValue",
            "Orginization":"orginizationValue",
            "Repository":"repositoryValue",
            "Host":"hostValue",
            "InstallationID":"installationIDValue",
            "Addition":"AdditionValue",
            "ReleaseName":"ReleaseNameValue",
            "ReleaseBody":"ReleaseBodyValue",
            "ReleaseTag":"ReleaseTagValue",
            "ReleaseCommitish":"ReleaseCommitishValue"
        ]
        
        return GitHubAPIRequest(action: GitHubAPIArgument.action(arguments["Action"]!),
                         token: GitHubAPIArgument.token(arguments["Token"]!),
                         orginization: GitHubAPIArgument.orginization(arguments["Orginization"]!),
                         repository: GitHubAPIArgument.repository(arguments["Repository"]!),
                         host: GitHubAPIArgument.host(arguments["Host"]!),
                         installationID: GitHubAPIArgument.installationID(arguments["InstallationID"]!),
                         releaseName: GitHubAPIArgument.Release.name(arguments["ReleaseName"]!),
                         releaseBody: GitHubAPIArgument.Release.body(arguments["ReleaseBody"]!),
                         releaseTag: GitHubAPIArgument.Release.tag(arguments["ReleaseTag"]!),
                         releaseCommitish: GitHubAPIArgument.Release.commitish(arguments["ReleaseCommitish"]!))
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
    
    func testGitHubAPIReleaseName() {
        XCTAssertEqual(request.releaseName?.value, "ReleaseNameValue")
    }
    
    func testGitHubAPIReleaseBody() {
        XCTAssertEqual(request.releaseBody?.value, "ReleaseBodyValue")
    }
    
    func testGitHubAPIReleaseTag() {
        XCTAssertEqual(request.releaseTag?.value, "ReleaseTagValue")
    }
    
    func testGitHubAPIReleaseCommitish() {
        XCTAssertEqual(request.releaseCommitish?.value, "ReleaseCommitishValue")
    }
}
