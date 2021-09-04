
module Model where

import qualified Data.Text as T

newtype Model = Model { _messages :: [T.Text] }

newModel :: Model
newModel = Model []

