import XCTest
@testable import GitHubAPICommand

final class JSONParserTest: XCTestCase {
    func testJSONParserParsedDictioinary() {
        let bundle = Bundle(for: JSONParserTest.self)
        guard let url = bundle.url(forResource: "MockData", withExtension: ".json"),
            let data = try? Data.init(contentsOf: url) else {
                let dic = [
                    "Foo" : "Bar",
                    "Cat" : "Meow"
                ]
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
                    let parser = JSONParser(data: jsonData)
                    XCTAssertNotNil(parser.parsedDictionary)
                } catch {
                    XCTFail("testJSONParserParsedDictioinary Failed")
                }
            return
        }
        let parser = JSONParser(data: data)
        XCTAssertNotNil(parser.parsedDictionary)
    }
}
