import XCTest
@testable import GitHubAPICommand

class ServicesTests: XCTestCase {
    
    let session = MockURLSession()
    let arguments = [
        "Action":"actionValue",
        "Token":"tokenValue",
        "Orginization":"orginizationValue",
        "Repository":"repositoryValue",
        "Host":"hostValue",
        "InstallationID":"installationIDValue",
        "Addition":"AdditionValue"
    ]
    
    func testServices() {
        let services = Services(session: session)
        let request = GitHubAPIRequest.init(arguments: arguments)
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
        
        let request = GitHubAPIRequest.init(arguments: arguments)
        guard let url = URL(string: "http://www.google.com") else {
            XCTAssert(false, "url shouldn't be nil")
            return
        }
        services.get(request: request, url: url) { (data, response, error) in
            XCTAssertTrue(self.session.dataTask.resumeWasCalled)
        }
    }
    
}
