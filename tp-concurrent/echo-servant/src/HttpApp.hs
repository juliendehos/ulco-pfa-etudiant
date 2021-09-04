{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

module HttpApp (httpApp) where

import qualified Data.Text as T

import Control.Concurrent
import Control.Monad
import Control.Monad.IO.Class (liftIO)
import Lucid
import Servant
import Servant.HTML.Lucid

import Model

-------------------------------------------------------------------------------
-- types, API
-------------------------------------------------------------------------------

newtype HomeData = HomeData Model

type HomeRoute = Get '[HTML] HomeData

type ServerApi
    =    HomeRoute

-- TODO MessagesRoute

-------------------------------------------------------------------------------
-- handlers
-------------------------------------------------------------------------------

handleServerApi :: MVar Model -> Server ServerApi
handleServerApi var
    =   handleHome var

handleHome :: MVar Model -> Handler HomeData
handleHome var = do
    model <- liftIO $ readMVar var
    return $ HomeData model

-- TODO handleMessages

-------------------------------------------------------------------------------
-- app
-------------------------------------------------------------------------------

httpApp :: MVar Model -> Application
httpApp var = serve (Proxy @ServerApi) (handleServerApi var)

-------------------------------------------------------------------------------
-- html rendering
-------------------------------------------------------------------------------

instance ToHtml HomeData where
    toHtmlRaw = toHtml

    toHtml (HomeData model) = doctypehtml_ $ do
        head_ $ do
            meta_ [charset_ "utf-8"]
            meta_ [ name_ "viewport"
                  , content_ "width=device-width,initial-scale=1,shrink-to-fit=no"]
            title_ "echo-servant"
            style_ "body {background-color: beige}"

        body_ $ do
            h1_ "echo-servant"

            -- TODO
