import XCTest
@testable import GitHubAPICommand

final class GitHubAPIArgumentKeyTest: XCTestCase {
    func testGitHubAPIArgumentKeyTokenValue() {
        XCTAssertEqual(GitHubAPIArgumentKey.token, "Token")
    }
    
    func testGitHubAPIArgumentKeyOrginizationValue() {
        XCTAssertEqual(GitHubAPIArgumentKey.orginization, "Orginization")
    }
    
    func testGitHubAPIArgumentKeyRepositoryValue() {
        XCTAssertEqual(GitHubAPIArgumentKey.repository, "Repository")
    }
    
    func testGitHubAPIArgumentKeyHostValue() {
        XCTAssertEqual(GitHubAPIArgumentKey.host, "Host")
    }
    
    func testGitHubAPIArgumentKeyInstallationIDValue() {
        XCTAssertEqual(GitHubAPIArgumentKey.installationID, "InstallationID")
    }
    
    func testGitHubAPIArgumentKeyActionValue() {
        XCTAssertEqual(GitHubAPIArgumentKey.action, "Action")
    }
}

final class GitHubAPIArgumentTest: XCTestCase {
    
    func testGitHubAPIArgumentActionValue() {
        let argument = GitHubAPIArgument.action("action")
        XCTAssertEqual(argument.value, "action")
    }
    
    func testGitHubAPIArgumentTokenValue() {
        let argument = GitHubAPIArgument.token("token")
        XCTAssertEqual(argument.value, "token")
    }
    
    func testGitHubAPIArgumentOrginizationValue() {
        let argument = GitHubAPIArgument.orginization("orginization")
        XCTAssertEqual(argument.value, "orginization")
    }
    
    func testGitHubAPIArgumentRepositoryValue() {
        let argument = GitHubAPIArgument.repository("repository")
        XCTAssertEqual(argument.value, "repository")
    }
    
    func testGitHubAPIArgumentHostValue() {
        let argument = GitHubAPIArgument.host("host")
        XCTAssertEqual(argument.value, "host")
    }
    
    func testGitHubAPIArgumentInstallationIDValue() {
        let argument = GitHubAPIArgument.installationID("installationID")
        XCTAssertEqual(argument.value, "installationID")
    }
    
    func testGitHubAPIArgumentDescriptionValue() {
        let argument = GitHubAPIArgument.action("action")
        XCTAssertEqual(argument.description(), "Action")
    }
    
    func testGitHubAPIArgumentTokenDescription() {
        let argument = GitHubAPIArgument.token("token")
        XCTAssertEqual(argument.description(), "Token")
    }
    
    func testGitHubAPIArgumentOrginizationDescription() {
        let argument = GitHubAPIArgument.orginization("orginization")
        XCTAssertEqual(argument.description(), "Orginization")
    }
    
    func testGitHubAPIArgumentRepositoryDescription() {
        let argument = GitHubAPIArgument.repository("repository")
        XCTAssertEqual(argument.description(), "Repository")
    }
    
    func testGitHubAPIArgumentHostDescription() {
        let argument = GitHubAPIArgument.host("host")
        XCTAssertEqual(argument.description(), "Host")
    }
    
    func testGitHubAPIArgumentInstallationIDDescription() {
        let argument = GitHubAPIArgument.installationID("installationID")
        XCTAssertEqual(argument.description(), "InstallationID")
    }
}
