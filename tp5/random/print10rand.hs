
import Control.Monad (forM_)
import System.Random

main :: IO ()
main = do
    gen <- getStdGen
    forM_ [1..10] $ \i -> do
        x <- randomRIO (1, 100::Int)
        putStrLn $ "iteration " ++ show i ++ ": " ++ show x

