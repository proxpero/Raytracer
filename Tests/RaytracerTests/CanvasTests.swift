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
        c.setPixel(red, col: 2, row: 3)
        XCTAssertEqual(c.pixelAt(col: 2, row: 3), red)
    }

    func testPPM() {
        var c: Canvas = .init(width: 5, height: 3)
        let c1: Color = .init(1.5, 0, 0)
        let c2: Color = .init(0, 0.5, 0)
        let c3: Color = .init(-0.5, 0, 1)
        c.setPixel(c1, col: 0, row: 0)
        c.setPixel(c2, col: 2, row: 1)
        c.setPixel(c3, col: 4, row: 2)
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
