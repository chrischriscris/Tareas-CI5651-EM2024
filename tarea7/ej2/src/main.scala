import scala.io.Source
import scala.collection.mutable.Stack

/**
 * A special stack that keeps track of the next-to-top element in constant time.
 */
class SStack[T] {
  private val stack = Stack[T]()
  private var _nextToTop: Option[T] = None

  def this(elems: T*) = {
    this()
    for (elem <- elems) {
      push(elem)
    }
  }

  def push(elem: T): Unit = {
    if (stack.length > 0) {
      _nextToTop = Some(stack.top)
    }

    stack.push(elem)
  }

  def pop: T = {
    val result = stack.pop

    if (stack.length > 1) {
      val temp = stack.pop
      _nextToTop = Some(stack.top)
      stack.push(temp)
    } else {
      _nextToTop = None
    }

    result
  }

  def top: T = {
    stack.top
  }

  def nextToTop: T = {
    _nextToTop.get
  }

  def toSet: Set[T] = {
    stack.toSet
  }

  def length: Int = {
    stack.length
  }
}

class Peeler(var points: List[(Double, Double)]) {
  def solve: Int = {
    val sortedPoints = points.sortBy(p => (p._1, -p._2))
    var layers = 0

    while (points.nonEmpty) {
      points = points.filterNot(convexHull.contains(_))
      layers += 1
    }

    layers
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
    val filteredPoints = points.filter(_ != minPoint)
    val sortedPoints = filteredPoints.sortWith(lessThan(minPoint))

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

@main def main(args: String*): Unit = {
  val filename = args(0)
  val points = parseInstance(filename)

  val solver = new Peeler(points)
  println(solver.solve)
}

def parseInstance(filename: String): List[(Double, Double)] = {
  val lines = Source.fromFile(filename).getLines
  val points = lines.map(line => {
    val Array(x, y) = line.split(" ")
    (x.toDouble, y.toDouble)
  }).toList
  points
}