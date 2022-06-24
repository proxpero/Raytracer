import simd

typealias Vector = SIMD3<Double>

extension Vector {
    var magnitude: Double {
        length(self)
    }

    var normal: Self {
        normalize(self)
    }
}
