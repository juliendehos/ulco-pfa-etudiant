{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module GithubApi where

import Data.Text
import Servant

import Repo
import User

type AgentHeader = Header "User-Agent" Text

-- api.github.com/users/<user>
type UserApi = "users" :> Capture "user" Text :> AgentHeader :> Get '[JSON] (Maybe User)

-- api.github.com/repositories/<repo>
-- TODO

-- api.github.com/users/<user>/repos
-- TODO

