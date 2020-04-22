
newtype Person = Person String deriving Show

persons :: [Person]
persons = [Person "John", Person "Haskell"]

main :: IO ()
main = print persons

