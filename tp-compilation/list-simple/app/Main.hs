
import Control.Monad (when)
import System.Environment (getArgs)
import System.IO (hFlush, stdout)

import Codegen
import Syntax
import Parser.ReadP as ReadP
import Parser.Monadic as Monadic
import Parser.Parsec as Parsec
import Parser.Recursive1 as Recursive1
import Parser.Recursive2 as Recursive2

main :: IO ()
main = do
    args <- getArgs
    case args of
        ["readp"] -> putStrLn "\nreadp" >> run ReadP.parseList
        ["monadic"] -> putStrLn "\nmonadic" >> run Monadic.parseList
        ["parsec"] -> putStrLn "\nparsec" >> run Parsec.parseList
        ["recursive1"] -> putStrLn "\nrecursive1" >> run Recursive1.parseList
        ["recursive2"] -> putStrLn "\nrecursive2" >> run Recursive2.parseList
        _ -> putStrLn "usage: <readp|monadic|parsec|recursive1|recursive2>"

run :: (String -> Either String List) -> IO ()
run p = do
    putStr "\n> "
    hFlush stdout
    line <- getLine
    when (line /= "") $ do
        case p line of
            Left err -> putStrLn $ "error: " ++ err
            Right list -> do
                print list
                putStrLn $ toLisp list
                putStrLn $ toHaskell list
        run p

