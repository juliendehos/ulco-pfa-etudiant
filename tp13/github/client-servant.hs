{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}

import Data.Proxy 
import Data.Text hiding (take)
import Network.HTTP.Client (newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Servant
import Servant.Client

import GithubApi
import Repo
import User

type MyApi = UserApi :<|> RepoApi 

getUser :: Text -> Maybe Text -> ClientM (Maybe User)
getRepo :: Int -> Maybe Text -> ClientM Repo
getUser :<|> getRepo = client (Proxy @MyApi)

userAgent :: Maybe Text
userAgent = Just "MyClient"

main :: IO ()
main = do
    mgr <- newManager tlsManagerSettings
    let env = mkClientEnv mgr (BaseUrl Https "api.github.com" 443 "")

    putStrLn "\ngetUser(juliendehos):"
    runClientM (getUser "juliendehos" userAgent) env >>= print

    putStrLn "\ngetRepo(137743929):"
    -- TODO

    putStrLn "\ngetUserRepos(juliendehos):"
    -- TODO

