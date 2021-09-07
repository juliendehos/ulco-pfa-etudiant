module Pnm where

import Control.Monad
import Data.Time
import Data.Word
import Linear.V3
import System.IO
import Text.Read

import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as C
import qualified Data.Vector as V

import Image

-- readPnm :: FilePath -> IO (Either String Image)
-- writePnm :: FilePath -> Image -> IO ()
-- word2double :: Word8 -> Double
-- double2word :: Double -> Word8
-- ...

