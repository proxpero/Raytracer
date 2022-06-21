import Foundation
@testable import Raytracer

extension Canvas {
    func writePPM(to filename: String) throws {
        let path = FileManager.default.urls(
            for: FileManager.SearchPathDirectory.desktopDirectory,
            in: .userDomainMask
        )[0].relativePath + "/\(filename).ppm"
        try ppm.write(toFile: path, atomically: true, encoding: .utf8)
    }
}
