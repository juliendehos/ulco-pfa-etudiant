import Database.SQLite.Simple (open, close)

import Movie1
import Movie2

main :: IO ()
main = do
    conn <- open "movie.db"

    putStrLn "\nMovie1.dbSelectAllMovies"
    -- TODO

    close conn

