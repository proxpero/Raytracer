struct Point: Equatable {
    let x: Double
    let y: Double
    let z: Double

    init(_ x: Double, _ y: Double, _ z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}

func + (p: Point, v: Vector) -> Point {
    .init(p.x + v.x, p.y + v.y, p.z + v.z)
}

func += (p: inout Point, v: Vector) {
    p = p + v
}

func - (p1: Point, p2: Point) -> Vector {
    .init(p1.x - p2.x, p1.y - p2.y, p1.z - p2.z)
}

func - (p: Point, v: Vector) -> Point {
    .init(p.x - v.x, p.y - v.y, p.z - v.z)
}
