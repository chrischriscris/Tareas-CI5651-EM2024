module WPSTree (buildWPSTree, queryWPSTree) where

-- | Segment Tree for well-parenthesized substrings
data STree = Node (Int, Int, Int) STree STree | Leaf (Int, Int, Int)
  deriving (Show)

-- ========== Build Segment Tree ==========

-- | Builds a Segment Tree to query well-parenthesized substrings of a given
-- string of parentheses wpSTree
buildWPSTree :: String -> STree
buildWPSTree "(" = Leaf (1, 0, 0)
buildWPSTree ")" = Leaf (0, 1, 0)
buildWPSTree str = combine left right
  where
    left = buildWPSTree $ take half str
    right = buildWPSTree $ drop half str
    half = (length str + 1) `div` 2

-- | Given two segment trees, combine them into a new segment tree with the
-- given STree as the left and right subtrees
combine :: STree -> STree -> STree
combine s1 s2 = Node (combineValues (getValue s1) (getValue s2)) s1 s2

combineValues :: (Int, Int, Int) -> (Int, Int, Int) -> (Int, Int, Int)
combineValues (l1, r1, wp1) (l2, r2, wp2) = (l1 + l2 - newWP, r1 + r2 - newWP, wp1 + wp2 + 2*newWP)
  where
    newWP = min l1 r2

getValue :: STree -> (Int, Int, Int)
getValue (Leaf v) = v
getValue (Node v _ _) = v

-- ========== Query Segment Tree ==========

-- | Given a segment tree and two indices, return the length of the longest
-- well-parenthesized substring in the range [i, j]
queryWPSTree :: STree -> Int -> Int -> Int
queryWPSTree sTree i j
  | i > j || i < 0 || j > n = error $ "Invalid query" ++ show (i, j, n)
  | otherwise = result
  where
    n = treeStringSize sTree - 1
    (_, _, result) = query sTree i j 0 n

-- | Given a segment tree, return the size of the string it represents
treeStringSize :: STree -> Int
treeStringSize (Leaf (l, r, _)) = l + r
treeStringSize (Node (l, r, wp) _ _) = l + r + wp

-- Queries the segment tree given a query range and the bounds of the current
-- segment tree node
query :: STree -> Int -> Int -> Int -> Int -> (Int, Int, Int)
query sTree i j leftBound rightBound
  | i == leftBound && j == rightBound = getValue sTree
  | otherwise =
    if j <= mid
      then query lSTree i j leftBound mid
      else
        if i > mid
          then query rSTree i j (mid + 1) rightBound
          else combineValues (query lSTree i mid leftBound mid) (query rSTree (mid + 1) j (mid + 1) rightBound)
  where
    mid = (leftBound + rightBound) `div` 2
    (lSTree, rSTree) = getChildren sTree
    getChildren (Node _ l r) = (l, r)
    getChildren _ = error "Invalid query"
