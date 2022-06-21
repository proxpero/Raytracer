import Darwin

struct Vector: Equatable {
    let x: Double
    let y: Double
    let z: Double

    init(_ x: Double, _ y: Double, _ z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}

extension Vector {
    var magnitude: Double {
        sqrt(x * x + y * y + z * z)
    }

    var normal: Vector {
        let m = magnitude
        return .init(x / m, y / m, z / m)
    }
}

func + (v1: Vector, v2: Vector) -> Vector {
    .init(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z)
}

func += (v1: inout Vector, v2: Vector) {
    v1 = v1 + v2
}

func - (v1: Vector, v2: Vector) -> Vector {
    .init(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z)
}

prefix func - (v: Vector) -> Vector {
    .init(-v.x, -v.y, -v.z)
}

func * (_ v: Vector, _ s: Double) -> Vector {
    .init(v.x * s, v.y * s, v.z * s)
}

func *= (v1: inout Vector, s: Double) {
    v1 = v1 * s
}

func / (_ v: Vector, _ s: Double) -> Vector {
    .init(v.x / s, v.y / s, v.z / s)
}

func dot(_ v1: Vector, _ v2: Vector) -> Double {
    v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
}

func cross(_ v1: Vector, _ v2: Vector) -> Vector {
    .init(
        v1.y * v2.z - v1.z * v2.y,
        v1.z * v2.x - v1.x * v2.z,
        v1.x * v2.y - v1.y * v2.x
    )
}
