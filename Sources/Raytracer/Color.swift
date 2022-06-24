import simd
typealias Color = SIMD3<Double>

extension Color {
    init(red: Double, green: Double, blue: Double) {
        self = .init(x: red, y: green, z: blue)
    }

    var red: Double {
        self.x
    }

    var green: Double {
        self.y
    }

    var blue: Double {
        self.z
    }

    static let black: Color = .init(0, 0, 0)
    static let red: Color = .init(1, 0, 0)
    static let green: Color = .init(0, 1, 0)
    static let blue: Color = .init(0, 0, 1)
}

extension Color {
    var pixelString: String {
        let n: simd_int3 = simd_int3(simd.clamp(self * 255, min: 0, max: 255).rounded(.toNearestOrAwayFromZero))
        return "\(n.x) \(n.y) \(n.z)"
    }
}

