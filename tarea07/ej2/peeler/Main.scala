package peeler

import scala.io.Source
import scala.collection.mutable.Stack
import scala.collection.mutable.ArrayBuffer

@main def peel(args: String*): Unit = {
  val filename = args(0)
  val points = parseInstance(filename)

  val solver = new Peeler(points)
  println(solver.solve)
}

