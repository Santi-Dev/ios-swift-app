import XCTest
@testable import AppTests

fileprivate extension AppTests {
    @available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
    static nonisolated(unsafe) let __allTests__AppTests = [
        ("testCounterIncrement", testCounterIncrement),
        ("testCounterReset", testCounterReset)
    ]
}
@available(*, deprecated, message: "Not actually deprecated. Marked as deprecated to allow inclusion of deprecated tests (which test deprecated functionality) without warnings")
func __AppTests__allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AppTests.__allTests__AppTests)
    ]
}