import scala.io.Source
import scala.collection.mutable.Stack

class Peeler(val points: List[(Double, Double)]) {
  def solve(): Int = {
    val sortedPoints = points.sortBy(p => (p._1, -p._2))
    val hull = convexHull()

    println("Hull: " + hull)
    hull.length
  }

  /**
   * Returns a sorting function that sorts points by their angle with a
   * reference point.
   *
   * The function returned compares two points by their angle with a reference
   * point, and returns true if p2 is within a right turn from p1.
   */
  private def lessThan(ref: (Double, Double))
    (p1: (Double, Double), p2: (Double, Double)): Boolean = {
    // ^^ What a nice currying syntax
    val (x1, y1) = (p1._1 - ref._1, p1._2 - ref._2)
    val (x2, y2) = (p2._1 - ref._1, p2._2 - ref._2)

    return x1 * y2 - x2 * y1 < 0
  }

  private def convexHull(): List[(Double, Double)] = {
    val minPoint = points.minBy(p => (p._1, -p._2))
    val filteredPoints = points.filter(_ != minPoint)
    val sortedPoints = filteredPoints.sortWith(lessThan(minPoint))

    val stack = Stack[(Double, Double)]()
    stack.push(minPoint)
    stack.push(sortedPoints(0))

    for (i <- 1 until sortedPoints.length) {
      val p = sortedPoints(i)
      while (stack.length > 1 && !lessThan(stack.pop)(stack.top, p)) {
        // Pop points from the stack until the last two points and the new
        // point form a right turn
      }
      stack.push(p)
    }

    stack.toList
  }
}

@main def main(args: String*): Unit = {
  // Read filename from command line
  val filename = args(0)
  val points = getPoints(filename)

  val solver = new Peeler(points)
  println("Result: " + solver.solve())
}

def getPoints(filename: String): List[(Double, Double)] = {
  val lines = Source.fromFile(filename).getLines
  val points = lines.map(line => {
    val Array(x, y) = line.split(" ")
    (x.toDouble, y.toDouble)
  }).toList
  points
}
