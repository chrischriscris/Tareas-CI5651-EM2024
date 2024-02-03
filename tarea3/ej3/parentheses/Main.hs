import System.Environment (getArgs)

data STree = Node (Int, Int, Int) STree STree | Leaf (Int, Int)
  deriving (Show)

sumNodes :: STree -> STree -> (Int, Int, Int)
sumNodes (Leaf (1, 0)) (Leaf (0, 1)) = (0, 0, 2)
sumNodes (Leaf (l1, r1)) (Leaf (l2, r2)) = (l1 + l2, r1 + r2, 0)

sumNodes (Node (l1, r1, wp) _ _) (Leaf (l2, r2)) =
    if l1 >= r2
        then (l1 - r2 + l2, r1, 2*r2 + wp)
        else (l2, r2 - l1 + r1, 2*l1 + wp)

sumNodes (Leaf (l1, r1)) (Node (l2, r2, wp) _ _) =
    if l1 >= r2
        then (l1 - r2 + l2, r1, 2*r2 + wp)
        else (l2, r2 - l1 + r1, 2*l1 + wp)

sumNodes (Node (l1, r1, wp1) _ _) (Node (l2, r2, wp2) _ _) =
    if l1 >= r2
        then (l1 - r2 + l2, r1, 2*r2 + wp1 + wp2)
        else (l2, r2 - l1 + r1, 2*l1 + wp1 + wp2)

combine :: STree -> STree -> STree
combine lSTree rSTree = Node (sumNodes lSTree rSTree) lSTree rSTree

-- Well-parenthesized Segment Tree, stores the number of left and right
-- hanging parentheses, and the number of well-parenthesized substrings
wpSTree :: String -> STree
wpSTree "(" = Leaf (1, 0)
wpSTree ")" = Leaf (0, 1)
wpSTree str = combine left right
    where left = wpSTree $ take half str
          right = wpSTree $ drop half str
          half = (length str + 1) `div` 2

main :: IO ()
main = do
    args <- getArgs
    let str = head args
    -- Return if the string contains other than parentheses
    if not (all (\x -> x == '(' || x == ')') str)
        then putStrLn "Invalid input"
        else putStrLn $ show $ wpSTree str

