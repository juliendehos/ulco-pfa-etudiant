{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}

import Data.Proxy (Proxy(..))
import Data.Text.Lazy (Text)
import Network.HTTP.Client (defaultManagerSettings, newManager)
import Servant.Client 

import Music
import Route

main :: IO ()
main = do
    putStrLn "TODO"

