import Control.Monad
import System.IO

import Mycalc.Codegen
import Mycalc.Parser

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
                print $ eval expr
        main

