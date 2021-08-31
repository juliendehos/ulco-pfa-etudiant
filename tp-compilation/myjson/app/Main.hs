import System.Environment

import Parser
import Codegen

main :: IO ()
main = do
    args <- getArgs
    case args of
        [filename] -> do
            content <- readFile filename
            case parseJson content of
                Left bundle -> putStrLn bundle
                Right json -> do
                    putStrLn $ "syntax: " ++ show json
                    putStrLn $ "codegen: " ++ toJson json
        _ -> putStrLn "usage: <filename>"

