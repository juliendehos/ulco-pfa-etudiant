-- import System.IO
-- import Text.Read (readMaybe)
import Tictactoe.Game
import Tictactoe.Fmt

-- TODO run
run :: Game -> IO ()
run g = do
    putStrLn $ "\n" <> fmtGame g

main :: IO ()
main = run newGameX

