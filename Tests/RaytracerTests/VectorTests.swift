import simd
import XCTest
@testable import Raytracer

final class VectorTests: XCTestCase {
    func testVectorPlusVector() {
        let a: Vector = .init(3, -2, 5)
        let b: Vector = .init(-2, 3, 1)
        XCTAssertEqual(a + b, Vector(1, 1, 6))
    }

    func testVectorPlusEqualsVector() {
        var a: Vector = .init(3, -2, 5)
        let b: Vector = .init(-2, 3, 1)
        a += b
        XCTAssertEqual(a, Vector(1, 1, 6))
    }

    func testVectorMinusVector() {
        let a: Vector = .init(3, 2, 1)
        let b: Vector = .init(5, 6, 7)
        XCTAssertEqual(a - b, Vector(-2, -4, -6))
    }

    func testVectorMinusZero() {
        let a: Vector = .init(0, 0, 0)
        let b: Vector = .init(1, -2, 3)
        XCTAssertEqual(a - b, Vector(-1, 2, -3))
    }

    func testNegation() {
        let a: Vector = .init(1, -2, 3)
        XCTAssertEqual(-a, Vector(-1, 2, -3))
    }

    func testVectorTimesScalar() {
        let v: Vector = .init(1, -2, 3)
        XCTAssertEqual(v * 3.5, .init(3.5, -7, 10.5))
    }

    func testVectorTimesEqualsScalar() {
        var v: Vector = .init(1, -2, 3)
        v *= 3.5
        XCTAssertEqual(v, .init(3.5, -7, 10.5))
    }

    func testVectorTimesFraction() {
        let v: Vector = .init(1, -2, 3)
        XCTAssertEqual(v * 0.5, .init(0.5, -1, 1.5))
    }

    func testVectorDividedByScalar() {
        let v: Vector = .init(1, -2, 3)
        XCTAssertEqual(v / 2, .init(0.5, -1, 1.5))
    }

    func testMagnitudeUnitX() {
        let v: Vector = .init(1, 0, 0)
        XCTAssertEqual(v.magnitude, 1)
    }

    func testMagnitudeUnitY() {
        let v: Vector = .init(0, 1, 0)
        XCTAssertEqual(v.magnitude, 1)
    }

    func testMagnitudeUnitZ() {
        let v: Vector = .init(0, 0, 1)
        XCTAssertEqual(v.magnitude, 1)
    }

    func testMagnitude() {
        let v1: Vector = .init(1, 2, 3)
        XCTAssertEqual(v1.magnitude, sqrt(14))

        let v2: Vector = .init(-1, -2, -3)
        XCTAssertEqual(v2.magnitude, sqrt(14))
    }

    func testNormalization() {
        let v1: Vector = .init(4, 0, 0)
        XCTAssertEqual(v1.normal, .init(1, 0, 0))

        let v2: Vector = .init(1, 2, 3)
        XCTAssertEqual(v2.normal, .init(1 / sqrt(14), 2 / sqrt(14), 3 / sqrt(14)))
    }

    func testDotProduct() {
        let v1: Vector = .init(1, 2, 3)
        let v2: Vector = .init(2, 3, 4)
        XCTAssertEqual(dot(v1, v2), 20)
    }

    func testCrossProduct() {
        let v1: Vector = .init(1, 2, 3)
        let v2: Vector = .init(2, 3, 4)
        XCTAssertEqual(cross(v1, v2), .init(-1, 2, -1))
        XCTAssertEqual(cross(v2, v1), .init(1, -2, 1))
    }
}
