
import Control.Concurrent
import Control.Monad
import Text.Printf
import System.Random

main :: IO ()
main = do
    run 0

run :: Int -> IO ()
run i = do
    let x = 1 :: Double
    printf "thread %d is waiting %.2f s...\n" i x
    threadDelay $ round $ x*1000000

