import System.Environment (getArgs)
import WPSTree (buildWPSTree)

main :: IO ()
main = do
  args <- getArgs
  let str = head args
  -- Return if the string contains other than parentheses
  if not $ all (`elem` "()") str
    then putStrLn "Invalid input"
    else print $ buildWPSTree str
