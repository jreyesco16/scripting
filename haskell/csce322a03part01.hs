import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers

-- The main method that will be used for testing / command line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (moves,maze) <- readMazeFile filename
     print "Result"
     printMaze (onePlayerOneSlide maze (head moves))

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerOneSlide :: [[Char]] -> Char -> [[Char]]
onePlayerOneSlide [] _ = []
onePlayerOneSlide ma mo = makeMove ma mo (head (quicksort (playerList ma)))




