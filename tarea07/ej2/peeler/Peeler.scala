package peeler

import scala.collection.mutable.ArrayBuffer

/**
 * Peels a set of points with multiple layers
 */
class Peeler(val points: ArrayBuffer[(Double, Double)]) {
  private var solution = -1

  /**
   * Returns the number of layers of the given list of points.
   */
  def solve: Int = {
    if (solution != -1) {
      return solution
    }

    var layers = 0
    while (points.nonEmpty) {
      // The result is a set, so this is O(n)
      points --= convexHull
      layers += 1
    }

    solution = layers
    solution
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
    // ^^ That's some nice syntax for currying, isn't it?
    val (x1, y1) = (p1._1 - ref._1, p1._2 - ref._2)
    val (x2, y2) = (p2._1 - ref._1, p2._2 - ref._2)

    return x1 * y2 - x2 * y1 < 0
  }

  /**
   * Returns the convex hull of the points in the list.
   *
   * If the list has less than 3 points, the convex hull is considered to be
   * the list itself.
   */
  private def convexHull: Set[(Double, Double)] = {
    if (points.length < 3) {
      return points.toSet
    }

    val minPoint = points.minBy(p => (p._1, -p._2))
    val sortedPoints = points.filter(_ != minPoint).sortWith(lessThan(minPoint))

    val stack = new SStack[(Double, Double)](minPoint, sortedPoints(0))
    for (i <- 1 until sortedPoints.length) {
      val p = sortedPoints(i)
      while (stack.length > 1 && !lessThan(stack.nextToTop)(stack.top, p)) {
        stack.pop
      }
      stack.push(p)
    }

    stack.toSet
  }
}
