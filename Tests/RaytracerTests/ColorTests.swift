import XCTest
@testable import Raytracer

extension Color {
    static let epsilon = 0.0000000000000001

    func isNearlyEqualTo(_ other: Color) -> Bool {
        abs(self.red - other.red) < Self.epsilon && abs(self.green - other.green) < Self.epsilon && abs(self.blue - other.blue) < Self.epsilon
    }
}

final class ColorTests: XCTestCase {
    func testAddingColors() {
        let c1: Color = .init(0.9, 0.6, 0.75)
        let c2: Color = .init(0.7, 0.1, 0.25)
        XCTAssertEqual(c1 + c2, .init(1.6, 0.7, 1.0))
    }

    func testAddingColorsInPlace() {
        var c1: Color = .init(0.9, 0.6, 0.75)
        let c2: Color = .init(0.7, 0.1, 0.25)
        c1 += c2
        XCTAssertEqual(c1, .init(1.6, 0.7, 1.0))
    }

    func testSubtractingingColors() {
        let c1: Color = .init(0.9, 0.6, 0.75)
        let c2: Color = .init(0.7, 0.1, 0.25)
        XCTAssertTrue((c1 - c2).isNearlyEqualTo(.init(0.2, 0.5, 0.5)))
    }

    func testColorTimesScalar() {
        let c: Color = .init(0.2, 0.3, 0.4)
        XCTAssertEqual(c * 2, .init(0.4, 0.6, 0.8))
    }

    func testMultiplyingingColors() {
        let c1: Color = .init(1, 0.2, 0.4)
        let c2: Color = .init(0.9, 1, 0.1)
        XCTAssertTrue((c1 * c2).isNearlyEqualTo(.init(0.9, 0.2, 0.04)))
    }
}
