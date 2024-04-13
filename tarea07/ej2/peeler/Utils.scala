package peeler

import scala.collection.mutable.ArrayBuffer
import scala.io.Source

/**
 * Parses a file with a list of points in the following format:
 *
 * x1 y1
 * x2 y2
 * ...
 * xn yn
 */
def parseInstance(filename: String): ArrayBuffer[(Double, Double)] = {
  Source.fromFile(filename).getLines.map(line => {
    val Array(x, y) = line.split(" ")
    (x.toDouble, y.toDouble)
  }).to(ArrayBuffer)
}
