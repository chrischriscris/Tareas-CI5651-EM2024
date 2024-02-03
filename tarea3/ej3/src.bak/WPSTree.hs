module WPSTree (buildWPSTree, queryWPSTree) where

-- | Segment Tree for well-parenthesized substrings
data STree = Node (Int, Int, Int) STree STree | Leaf (Int, Int)
  deriving (Show)

-- ========== Build Segment Tree ==========

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

-- | Given two segment trees, combine them into a new segment tree with the
-- given STree as the left and right subtrees
combine lSTree rSTree = Node (combineNodeValues lSTree rSTree) lSTree rSTree

combineNodes :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
combineNodes (l1, r1, wp1) (l2, r2, wp2)
  | l1 >= r2 = (l1 - r2 + l2, r1, 2 * r2 + wp1 + wp2)
  | otherwise = (l2, r2 - l1 + r1, 2 * l1 + wp1 + wp2)

combineNodeValues :: STree -> STree -> (Int, Int, Int)
combineNodeValues (Leaf (1, 0)) (Leaf (0, 1)) = (0, 0, 2)
combineNodeValues (Leaf (l1, r1)) (Leaf (l2, r2)) = (l1 + l2, r1 + r2, 0)
combineNodeValues (Node (l1, r1, wp) _ _) (Leaf (l2, r2))
  | l1 >= r2 = (l1 - r2 + l2, r1, 2 * r2 + wp)
  | otherwise = (l2, r2 - l1 + r1, 2 * l1 + wp)
combineNodeValues (Leaf (l1, r1)) (Node (l2, r2, wp) _ _)
  | l1 >= r2 = (l1 - r2 + l2, r1, 2 * r2 + wp)
  | otherwise = (l2, r2 - l1 + r1, 2 * l1 + wp)

combineNodeValues (Node v1 _ _) (Node v2 _ _) = combineNodes v1 v2
-- ========== Query Segment Tree ==========

-- | Given a segment tree, return the size of the string it represents
treeStringSize :: STree -> Int
treeStringSize (Leaf (l, r)) = l + r
treeStringSize (Node (l, r, wp) _ _) = l + r + wp

-- | Given a segment tree and two indices, return the length of the longest
-- well-parenthesized substring in the range [i, j]
queryWPSTree :: STree -> Int -> Int -> Int
queryWPSTree sTree i j
  | i > j || i < 0 || j > n = error "Invalid query"
  | otherwise = result
  where
    n = treeStringSize sTree - 1
    (_, _, result) = query sTree i j 0 n

query :: STree -> Int -> Int -> Int -> Int -> (Int, Int, Int)
query sTree i j leftBound rightBound
  | i == leftBound && j == rightBound = case sTree of
    Leaf (l, r) -> (l, r, 0)
    Node (l, r, wp) _ _ -> (l, r, wp)
  | otherwise = case sTree of
    Leaf _ -> error "Invalid query"
    Node _ lSTree rSTree -> let
      half = (leftBound + rightBound) `div` 2
      in if j <= half
        then query lSTree i j leftBound half
        else if i > half
          then query rSTree i j (half + 1) rightBound
            else combineNodes (query lSTree i half leftBound half)
                             (query rSTree (half + 1) j (half + 1) rightBound)


