{-# LANGUAGE DeriveGeneric #-}

-- | Protocol de communication client-serveur pour jouer au tictactoe.
module Tictactoe.Protocol
    ( decode
    , encode
    , ServerMsg(..)
    , ClientMsg(..)
    ) where

import Data.Aeson 
import GHC.Generics
import Tictactoe.Game

-- | Type de messages envoyés par le serveur.
data ServerMsg
    = Accept Player     -- ^ Le serveur accepte la connexion.
    | NewGame           -- ^ Le serveur informe qu'on commence une nouvelle partie.
    | AskMove Game      -- ^ Le serveur envoie un jeu et attend un coup.
    | Result Game       -- ^ Le serveur envoie un jeu final.
    deriving (Generic, Show)

-- | Type de messages envoyés par le client.
data ClientMsg
    = SendMove Int Int  -- ^ Le client envoie un coup, suite à la demande du serveur.
    deriving (Generic, Show)
    
-------------------------------------------------------------------------------
-- internal
-------------------------------------------------------------------------------

instance FromJSON ServerMsg

instance ToJSON ServerMsg where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON ClientMsg

instance ToJSON ClientMsg where
    toEncoding = genericToEncoding defaultOptions

