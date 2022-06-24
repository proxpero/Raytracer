import XCTest
@testable import Raytracer

final class CanvasTests: XCTestCase {
    func testCreatingCanvas() {
        let c: Canvas = .init(width: 10, height: 20)
        XCTAssertEqual(c.width, 10)
        XCTAssertEqual(c.height, 20)
        for pixel in c.pixels {
            XCTAssertEqual(pixel, .black)
        }
    }

    func testWritingPixels() {
        var c: Canvas = .init(width: 10, height: 20)
        let red: Color = .init(1, 0, 0)
        c[2, 3] = red
        XCTAssertEqual(c[2, 3], red)
    }

    func testPPM() {
        var c: Canvas = .init(width: 5, height: 3)
        let c1: Color = .init(1.5, 0, 0)
        let c2: Color = .init(0, 0.5, 0)
        let c3: Color = .init(-0.5, 0, 1)
        c[0, 0] = c1
        c[2, 1] = c2
        c[4, 2] = c3
        let expected = """
        P3
        5 3
        255
        255 0 0 0 0 0 0 0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 128 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 255\n
        """
        XCTAssertEqual(c.ppm, expected)
    }
}

