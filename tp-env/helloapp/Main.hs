{-# LANGUAGE OverloadedStrings #-}

import Data.Maybe (fromMaybe)
import System.Environment (lookupEnv)
import Web.Scotty (get, captureParam, scotty, text)

main :: IO ()
main = do
    port <- read . fromMaybe "3000" <$> lookupEnv "PORT"
    scotty port $ do

        get "/" $ text "Hello unknown user !"

        get "/:name" $ do
            name <- captureParam "name"
            text $ "Hello " <> name <> " !"

