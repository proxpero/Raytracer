@testable import Raytracer

struct Projectile {
    var position: Point
    var velocity: Vector
}

struct Environment {
    let gravity: Vector
    let wind: Vector
}

func tick(_ env: Environment, _ proj: inout Projectile) {
    proj.position += proj.velocity
    proj.velocity += env.gravity + env.wind
}

let initial1: Vector = .init(1, 1, 0).normal
let initial2: Vector = .init(1, 2, 0).normal
let initial3: Vector = .init(3, 1, 0).normal
let initial4: Vector = initial1 * 3

var p = Projectile(position: .init(0, 1, 0), velocity: initial4)
let e = Environment(gravity: .init(0, -0.1, 0), wind: .init(-0.01, 0, 0))

while p.position.y > 0 {
    tick(e, &p)
    print(p.position)
}
