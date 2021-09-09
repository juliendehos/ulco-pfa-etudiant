
import qualified Data.Vector as V
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

import Game

data Model = Model
    { _game :: Game
    , _selected :: Maybe Ix2
    }

main :: IO ()
main = 
    let model = Model (newGame PlayerR) Nothing
        window =  InWindow "breakthrough" (boardSize, boardSize) (0, 0)
        bgColor = makeColor 0.1 0.5 0.1 1.0
    in play window bgColor 1 model displayH eventH idleH

-------------------------------------------------------------------------------
-- constants
-------------------------------------------------------------------------------

boardSize :: Int
boardSize = 400

boardSize05c :: Float
boardSize05c = 0.5 * fromIntegral boardSize

deltaI, deltaJ :: Float
deltaI = fromIntegral boardSize / fromIntegral nI
deltaJ = fromIntegral boardSize / fromIntegral nJ

deltaI05, deltaJ05 :: Float
deltaI05 = deltaI * 0.5
deltaJ05 = deltaJ * 0.5

radius :: Float
radius = min deltaI deltaJ * 0.5 - 5

move0Pict, move1Pict :: Picture
move0Pict = color white $ thickCircle radius 2
move1Pict = color black $ thickCircle radius 4

-------------------------------------------------------------------------------
-- display handler
-------------------------------------------------------------------------------

drawGrid :: [Picture]
drawGrid = 
    let hs = [ line [(-boardSize05c, y), (boardSize05c, y)] 
                | y<-[-boardSize05c, deltaI-boardSize05c .. boardSize05c] ]
        vs = [ line [(x, -boardSize05c), (x, boardSize05c)] 
                | x<-[-boardSize05c, deltaJ-boardSize05c .. boardSize05c] ]
    in hs ++ vs

drawIJ :: Picture -> Ix2 -> Picture
drawIJ pict (i,j) = 
    let x = fromIntegral j * deltaJ - boardSize05c + deltaJ05
        y = fromIntegral i * deltaI - boardSize05c + deltaI05
    in translate x y pict

displayH :: Model -> Picture
displayH _ = 
    pictures $ drawGrid ++ [drawIJ move0Pict (1,1), drawIJ move1Pict (2,2)]
-- TODO
-- ...

-------------------------------------------------------------------------------
-- event handler
-------------------------------------------------------------------------------

xy2ij :: (Float, Float) -> Ix2
xy2ij (x,y) =
    let i = truncate $ (y + boardSize05c) / deltaI
        j = truncate $ (x + boardSize05c) / deltaJ
    in (i, j)

eventH :: Event -> Model -> Model
eventH _ m = m
-- TODO

-------------------------------------------------------------------------------
-- idle handler
-------------------------------------------------------------------------------

idleH :: Float -> Model -> Model
idleH _ = id

