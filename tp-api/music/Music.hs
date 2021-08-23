{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}

module Music where

import Data.Aeson (FromJSON, ToJSON)
import Data.Text.Lazy (Text)
import GHC.Generics (Generic)
import Servant 

data Music = Music 
    { _title :: Text 
    , _artist :: Text 
    , _year :: Int 
    } deriving (Generic, Show)

