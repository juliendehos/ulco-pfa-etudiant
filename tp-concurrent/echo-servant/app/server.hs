
import Control.Concurrent
import Network.Wai.Handler.Warp (run)

import Model
import HttpApp
import WsApp

main :: IO ()
main = do
    var <- newMVar newModel
    run 3000 
        $ wsApp var 
        $ httpApp var

