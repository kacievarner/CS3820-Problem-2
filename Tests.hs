module Tests where

-- GHC
import System.Exit
import Data.Char (isPunctuation)

-- External
import Test.HUnit
-- import Test.QuickCheck

-- Lib
import Problem2 (next, collatz)

p21, p22 :: Test
p21 = "p2-1" ~: test $
  (take 15 [ next x @?= y | (x, y) <- zip [2, 4..] [1..] ]) ++
  (take 15 [ next x @?= 3*x + 1 | x <- [1, 3..]])
      

p22 = "p1-2" ~: test $
   [ last (collatz x) @?= 1 | x <- [15..20]] ++
   [ head (collatz x) @?= x | x <- [35..40]] ++
   [ take 5 (collatz 50) @?= [50, 25, 76, 38, 19]]

tests = test [p21, p22]

main :: IO ()
main = do
  results <- runTestTT tests
  if (errors results + failures results == 0)
    then
      exitWith ExitSuccess
    else
      exitWith (ExitFailure 1)

  
