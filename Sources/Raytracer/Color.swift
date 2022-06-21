struct Color: Equatable {
    let red: Double
    let green: Double
    let blue: Double

    init(_ red: Double, _ green: Double, _ blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    static let black: Color = .init(0, 0, 0)
    static let red: Color = .init(1, 0, 0)
    static let green: Color = .init(0, 1, 0)
    static let blue: Color = .init(0, 0, 1)
}

func + (c1: Color, c2: Color) -> Color {
    .init(c1.red + c2.red, c1.green + c2.green, c1.blue + c2.blue)
}

func += (c1: inout Color, c2: Color) {
    c1 = c1 + c2
}

func - (c1: Color, c2: Color) -> Color {
    .init(c1.red - c2.red, c1.green - c2.green, c1.blue - c2.blue)
}

func * (c1: Color, s: Double) -> Color {
    .init(c1.red * s, c1.green * s, c1.blue * s)
}

func * (c1: Color, c2: Color) -> Color {
    .init(c1.red * c2.red, c1.green * c2.green, c1.blue * c2.blue)
}
