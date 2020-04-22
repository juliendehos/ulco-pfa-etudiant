import Options.Applicative

data Args = Args
    { hello      :: String
    , enthusiasm :: Int
    } deriving (Show)

argsP :: Parser Args
argsP = Args
      <$> strOption
          ( long "hello"
         <> help "Target for the greeting"
         <> metavar "TARGET")
      <*> option auto
          ( long "enthusiasm"
         <> help "How enthusiast?"
         <> metavar "INT"
         <> value 1)

myinfo :: ParserInfo Args
myinfo = info (argsP <**> helper)
              (fullDesc <> header "This is my cool app!")

main :: IO ()
main = execParser myinfo >>= print

