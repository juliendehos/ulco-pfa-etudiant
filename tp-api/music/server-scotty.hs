{-# LANGUAGE OverloadedStrings #-}

import Music

-- import Control.Monad (forM_)
-- import Data.Text.Lazy (pack)
-- import Lucid
import Web.Scotty

newtype Model = Model { _musics :: [Music] }

main :: IO ()
main = do
    let port = 3000
        model = Model myMusics
    scotty port (serverApp model)

serverApp :: Model -> ScottyM ()
serverApp _model = do

    get "/api" $ text "TODO"

    get "/api/artist/:name" $ text "TODO"

    get "/" $ text "TODO"

