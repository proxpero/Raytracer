import XCTest
@testable import Raytracer

final class PointTests: XCTestCase {
    func testPointPlusVector() {
        let a: Point = .init(3, -2, 5)
        let b: Vector = .init(-2, 3, 1)
        XCTAssertEqual(a + b, Point(1, 1, 6))
    }

    func testPointPlusEqualsVector() {
        var a: Point = .init(3, -2, 5)
        let b: Vector = .init(-2, 3, 1)
        a += b
        XCTAssertEqual(a, Point(1, 1, 6))
    }

    func testPointMinusPoint() {
        let a: Point = .init(3, 2, 1)
        let b: Point = .init(5, 6, 7)
        XCTAssertEqual(a - b, Vector(-2, -4, -6))
    }

    func testPointMinusVector() {
        let a: Point = .init(3, 2, 1)
        let b: Vector = .init(5, 6, 7)
        XCTAssertEqual(a - b, Point(-2, -4, -6))
    }
}
