import XCTest
@testable import Perfect_FileHandling

class Perfect_FileHandlingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Perfect_FileHandling().text, "Hello, World!")
    }


    static var allTests : [(String, (Perfect_FileHandlingTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
