import Prelude
import System.Environment ( getArgs )
import Data.List
import Data.Char
import Helpers
  
-- The main method that will be used for testing / command line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (moves,maze) <- readMazeFile filename
     print "Result"
     printMaze (manyPlayersManySlides maze moves)

-- YOUR CODE SHOULD COME AFTER THIS POINT
manyPlayersManySlides :: [[Char]] -> [Char] -> [[Char]]
manyPlayersManySlides ma mos = manyPlayersManySlidesHelp ma mos (quicksort (playerList ma))
