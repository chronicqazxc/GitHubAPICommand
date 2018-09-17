import XCTest
@testable import GitHubAPICommand

class ServicesTests: XCTestCase {
    
    let session = MockURLSession()
    
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
                                token: GitHubAPIArgument.action(arguments["Token"]!),
                                orginization: GitHubAPIArgument.action(arguments["Orginization"]!),
                                repository: GitHubAPIArgument.action(arguments["Repository"]!),
                                host: GitHubAPIArgument.action(arguments["Host"]!),
                                installationID: GitHubAPIArgument.action(arguments["InstallationID"]!))
    }
    
    func testServices() {
        let services = Services(session: session)
        guard let url = URL(string: "http://www.google.com") else {
            XCTAssert(false, "url shouldn't be nil")
            return
        }

        services.get(request: request, url: url) { (data, response, error) in
            XCTAssertEqual(self.session.url?.absoluteString, "http://www.google.com")
        }
    }
    
    func testServicesResumeWasCalled() {
        let services = Services(session: session)
        guard let url = URL(string: "http://www.google.com") else {
            XCTAssert(false, "url shouldn't be nil")
            return
        }
        services.get(request: request, url: url) { (data, response, error) in
            XCTAssertTrue(self.session.dataTask.resumeWasCalled)
        }
    }
    
}
