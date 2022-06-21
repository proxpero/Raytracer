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

let initial: Vector = .init(1, 1.8, 0) * 5.25

var p = Projectile(position: .init(0, 1, 0), velocity: initial)
let e = Environment(
    gravity: .init(0, -0.1, 0),
    wind: .init(-0.01, 0, 0)
)

var canvas: Canvas = .init(width: 900, height: 550)
let red: Color = .init(1, 0, 0)

while p.position.y > 0 {
    tick(e, &p)
    guard (0 ..< canvas.width).contains(Int(p.position.x)),
          (0 ..< canvas.height).contains(Int(p.position.y))
    else {
        print("rejecting \(p.position)")
        continue
    }
    canvas.setPixel(red, col: Int(p.position.x), row: canvas.height - Int(p.position.y))
}

try canvas.writePPM(to: "projectile")
