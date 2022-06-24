import simd

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
    subscript(col: Int, row: Int) -> Color {
        get {
            pixels[row * width + col]
        }

        set {
            pixels[row * width + col] = newValue
        }
    }

    var ppm: String {
        var rows: Substring = ""[...]
        for row in 0 ..< height {
            for col in 0 ..< width {
                rows.append(contentsOf: self[col, row].pixelString + " ")
            }

            rows = rows.dropLast()
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
