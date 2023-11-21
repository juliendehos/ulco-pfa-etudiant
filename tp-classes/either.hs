type MyNum = Either String Double

-- mySqrt :: Double -> MyNum

-- myMul2 :: Double -> MyNum

-- myNegate :: Double -> MyNum

myCompute1 :: MyNum
myCompute1 = Left "TODO avec case-of"

myCompute2 :: MyNum
myCompute2 = Left "TODO avec >>="

myCompute3 :: MyNum
myCompute3 = Left "TODO avec do"

main :: IO ()
main = do
    print myCompute1
    print myCompute2
    print myCompute3

