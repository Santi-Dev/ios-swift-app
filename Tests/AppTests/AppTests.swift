import XCTest
@testable import App

final class AppTests: XCTestCase {
    func testCounterIncrement() throws {
        let data = AppData()
        XCTAssertEqual(data.counter, 0)
        data.incrementCounter()
        XCTAssertEqual(data.counter, 1)
    }
    
    func testCounterReset() throws {
        let data = AppData()
        data.incrementCounter()
        data.incrementCounter()
        data.resetCounter()
        XCTAssertEqual(data.counter, 0)
    }
}
