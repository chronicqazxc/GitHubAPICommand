import XCTest

import GitHubAPICommandTests

var tests = [XCTestCaseEntry]()
tests += GitHubAPICommandTests.allTests()
XCTMain(tests)