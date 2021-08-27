{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

import Control.Monad (forM_)
import qualified Data.Text as T
import Data.Text.Lazy (Text, pack)
import Lucid
import Network.Wai.Handler.Warp (run)
import Servant 
import Servant.HTML.Lucid

import Music
import Route

newtype Model = Model { _musics :: [Music] }

type ApiHome = Get '[HTML] Model

type Api
    =    ApiHome
    -- TODO

myApiServer :: Model -> Server Api
myApiServer model
    =    pure model
    -- TODO

serverApp :: Model -> Application
serverApp model = serve (Proxy @Api) (myApiServer model)

main :: IO ()
main = do
    let port = 3000
        model = Model myMusics
    putStrLn $ "listening on port " <> show port <> "..."
    run port (serverApp model)

instance ToHtml Model where
    toHtmlRaw = toHtml

    toHtml model = doctypehtml_ $ do
    doctypehtml_ $ do
        head_ $ do
            meta_ [charset_ "utf-8"]
            meta_ [ name_ "viewport"
                  , content_ "width=device-width,initial-scale=1,shrink-to-fit=no"]
            title_ "Music"

        body_ $ do
            h1_ "TODO"
            -- TODO

-- linkApiAll :: URI
-- linkApiAll = linkURI $ safeLink (Proxy @Api) (Proxy @ApiAll)

-- linkApiArtist TODO

