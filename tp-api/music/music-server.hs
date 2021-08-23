{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

import Control.Monad (forM_)
import Data.Text.Lazy (Text, pack)
import Lucid
import Network.Wai.Handler.Warp (run)
import Servant 
import Servant.HTML.Lucid

import Music

newtype Model = Model { _musics :: [Music] }

type ApiHome = Get '[HTML] Model

type Api
    =    ApiHome

myApiServer :: Model -> Server Api
myApiServer model
    =    pure model

serverApp :: Model -> Application
serverApp model = serve (Proxy @Api) (myApiServer model)

main :: IO ()
main = do
    let port = 3000
        model = Model myMusics
    putStrLn $ "listening on port " <> show port <> "..."
    run port (serverApp model)

myMusics :: [Music]
myMusics = 
    [ Music "Paranoid android" "Radiohead" 1997
    , Music "Just" "Radiohead" 1995
    , Music "Take the power back" "Rage against the machine" 1991
    , Music "How I could just kill a man" "Rage against the machine" 2000
    , Music "La porte bonheur" "Ibrahim Maalouf" 2014
    ]

instance ToHtml Model where
    toHtmlRaw = toHtml

    toHtml model = h1_ "TODO"

