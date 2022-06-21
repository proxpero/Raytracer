import Foundation

struct Canvas {
    let width: Int
    let height: Int

    private(set) var pixels: [Color]

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
        self.pixels = Array<Color>(repeating: .black, count: width * height)
    }

    // Will crash if out of bounds!
    mutating func setPixel(_ p: Color, col: Int, row: Int) {
        pixels[row * width + col] = p
    }

    // Will crash if out of bounds!
    func pixelAt(col: Int, row: Int) -> Color {
        pixels[row * width + col]
    }

    var ppm: String {
        func normalized(_ value: Double) -> Int {
            return Int(max(0, min(255, (value * 255).rounded())))
        }

        func pixelString(_ color: Color) -> String {
            "\(normalized(color.red)) \(normalized(color.green)) \(normalized(color.blue)) "
        }

        var rows: Substring = ""[...]
        for row in 0 ..< height {
            for col in 0 ..< width {
                let value = pixelString(pixelAt(col: col, row: row))
                rows.append(contentsOf: value)
            }
            rows = rows.dropLast(1)
            rows.append("\n")
        }
        return """
        P3
        \(width) \(height)
        255
        \(rows)
        """
    }
}
