import System.Environment (getArgs)
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)
import WPSTree (buildWPSTree, queryWPSTree)
import Control.Monad (forever)

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering

  args <- getArgs
  let str = head args

  if not $ all (`elem` "()") str
    then putStrLn "Invalid input"
    else
        forever $ do
            putStr "Enter two indices to query the well-parenthesized substring: "
            input <- getLine
            let [i, j] = map read $ words input
            print $ queryWPSTree (buildWPSTree str) (i - 1) (j - 1)
