module Codegen where

import Data.List

import Syntax

class ToJson a where
    toJson :: a -> String

instance ToJson Value where
    toJson _ = "TODO"

instance ToJson Object where
    toJson _  = "TODO"

instance ToJson Member where
    toJson _  = "TODO"

