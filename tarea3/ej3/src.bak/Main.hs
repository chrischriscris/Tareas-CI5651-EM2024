import System.Environment (getArgs)
import WPSTree (buildWPSTree, queryWPSTree)

main :: IO ()
main = do
  args <- getArgs
  let str = head args
  -- Return if the string contains other than parentheses
  if not $ all (`elem` "()") str
    then putStrLn "Invalid input"
    else print $ queryWPSTree (buildWPSTree str) 2 6
