package peeler

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
