import Control.Monad (when)
import System.IO (hFlush, stdout)

import Codegen
import Parser

main :: IO ()
main = do
    putStr "\n> "
    hFlush stdout
    line <- getLine
    when (line /= "") $ do
        case parseExpr line of
            Left err -> putStrLn $ "error: " ++ err
            Right expr -> do
                print expr
                putStrLn $ toLisp expr
                putStrLn $ toJson expr
        main

