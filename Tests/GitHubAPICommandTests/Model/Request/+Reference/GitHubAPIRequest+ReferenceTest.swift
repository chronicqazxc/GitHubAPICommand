import XCTest
@testable import GitHubAPICommand

final class GitHubAPIRequest_ReferenceTest: XCTestCase {
    
    var request: GitHubAPIRequestFactory.CreateReference {
        let arguments = [
            "Action":"actionValue",
            "Token":"tokenValue",
            "Orginization":"orginizationValue",
            "Repository":"repositoryValue",
            "Host":"hostValue",
            "Reference":"referenceValue",
            "Sha":"shaValue"
        ]
        
        return GitHubAPIRequestFactory.CreateReference(
            orginization: GitHubAPIArgument.orginization(arguments["Orginization"]!),
            repository: GitHubAPIArgument.repository(arguments["Repository"]!),
            action: GitHubAPIArgument.action(arguments["Action"]!),
            token: GitHubAPIArgument.token(arguments["Token"]!),
            host: GitHubAPIArgument.host(arguments["Host"]!),
            referenece: GitHubAPIArgument.Reference.referenece(arguments["Reference"]!),
            sha: GitHubAPIArgument.Reference.sha(arguments["Sha"]!))
    }
    
    func testGitHubAPIRequestAction() {
        XCTAssertEqual(request.action.value, "actionValue")
    }
    
    func testGitHubAPIRequestToken() {
        XCTAssertEqual(request.token.value, "tokenValue")
    }
    
    func testGitHubAPIRequestOrginization() {
        XCTAssertEqual(request.orginization.value, "orginizationValue")
    }
    
    func testGitHubAPIRequestRepository() {
        XCTAssertEqual(request.repository.value, "repositoryValue")
    }
    
    func testGitHubAPIRequestHost() {
        XCTAssertEqual(request.host?.value, "hostValue")
    }
    
    func testGitHubAPIRequestReference() {
        XCTAssertEqual(request.referenece.value, "referenceValue")
    }
    
    func testGitHubAPIRequestSha() {
        XCTAssertEqual(request.sha.value, "shaValue")
    }
}
