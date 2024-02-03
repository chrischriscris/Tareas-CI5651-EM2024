module WPSTree (buildWPSTree) where

-- | Segment Tree for well-parenthesized substrings
data STree = Node (Int, Int, Int) STree STree | Leaf (Int, Int)
  deriving (Show)

sumNodes :: STree -> STree -> (Int, Int, Int)
sumNodes (Leaf (1, 0)) (Leaf (0, 1)) = (0, 0, 2)
sumNodes (Leaf (l1, r1)) (Leaf (l2, r2)) = (l1 + l2, r1 + r2, 0)
sumNodes (Node (l1, r1, wp) _ _) (Leaf (l2, r2))
  | l1 >= r2 = (l1 - r2 + l2, r1, 2 * r2 + wp)
  | otherwise = (l2, r2 - l1 + r1, 2 * l1 + wp)
sumNodes (Leaf (l1, r1)) (Node (l2, r2, wp) _ _)
  | l1 >= r2 = (l1 - r2 + l2, r1, 2 * r2 + wp)
  | otherwise = (l2, r2 - l1 + r1, 2 * l1 + wp)
sumNodes (Node (l1, r1, wp1) _ _) (Node (l2, r2, wp2) _ _)
  | l1 >= r2 = (l1 - r2 + l2, r1, 2 * r2 + wp1 + wp2)
  | otherwise = (l2, r2 - l1 + r1, 2 * l1 + wp1 + wp2)

-- | Given two segment trees, combine them into a new segment tree with the
-- given STree as the left and right subtrees
combine lSTree rSTree = Node (sumNodes lSTree rSTree) lSTree rSTree

-- | Builds a Segment Tree to query well-parenthesized substrings of a given
-- string of parentheses wpSTree
buildWPSTree :: String -> STree
buildWPSTree "(" = Leaf (1, 0)
buildWPSTree ")" = Leaf (0, 1)
buildWPSTree str = combine left right
  where
    left = buildWPSTree $ take half str
    right = buildWPSTree $ drop half str
    half = (length str + 1) `div` 2
