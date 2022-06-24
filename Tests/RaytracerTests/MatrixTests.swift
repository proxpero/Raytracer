import XCTest
@testable import Raytracer

final class Matrix4Tests: XCTestCase {
    func testConstructionAndInspection() {
        let m = Matrix4(
            [1, 2, 3, 4],
            [5.5, 6.5, 7.5, 8.5],
            [9, 10, 11, 12],
            [13.5, 14.5, 15.5, 16.5]
        )

        XCTAssertEqual(m[0, 0], 1)
        XCTAssertEqual(m[0, 3], 4)
        XCTAssertEqual(m[1, 2], 7.5)
        XCTAssertEqual(m[2, 2], 11)
        XCTAssertEqual(m[3, 0], 13.5)
        XCTAssertEqual(m[3, 2], 15.5)
    }

    func testEqualityWithIdenticalMatrices() {
        let a: Matrix4 = .init(
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 8, 7, 6],
            [5, 4, 3, 2]
        )

        let b: Matrix4 = .init(
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 8, 7, 6],
            [5, 4, 3, 2]
        )

        XCTAssertEqual(a, b)
    }

    func testEqualityWithDifferentMatrices() {
        let a: Matrix4 = .init(
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9, 8, 7, 6],
            [5, 4, 3, 2]
        )

        let b: Matrix4 = .init(
            [2, 3, 4, 5],
            [6, 7, 8, 9],
            [8, 7, 6, 5],
            [4, 3, 2, 1]
        )

        XCTAssertNotEqual(a, b)
    }
}
