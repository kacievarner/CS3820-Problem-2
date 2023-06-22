module Problem2 (next, collatz) where

{-------------------------------------------------------------------------------

CS:3820 Fall 2021 Problem of the Week, Week 2
=============================================

The problem this week builds on the ideas of recursion developed during this
week's lecture.  The "Collatz conjecture" is a famous unproven result in
mathematics, named after the German mathematician Lothar Collatz.  The
conjecture is based on the following mathematical function on integers:

     f(x) =  x / 2           if x is even
             3x + 1          if x is odd

A Collatz sequence starting at n is a series of numbers

  n, f(n), f(f(n)), ...

until it reaches 1.  For example, the Collatz sequence starting at 3 is:

  3, 10, 5, 16, 8, 4, 2, 1

The Collatz conjecture is that the Collatz sequence reaches 1 for every positive
starting value.  In this problem, you'll develop a function `collatz n` which
returns the Collatz sequence starting from `n`.

-------------------------------------------------------------------------------}

{------------------------------------------------------------------------------

Problem 2-1
-----------

We'll begin by defining a function `next` that computes the function `f` for the
Collatz sequence.  For example, `next 10` should return `5`, and `next 5` should
return `16`.

You may need a couple of Haskell functions to do this: the `even` function
returns True if its argument is even, the `odd` function does the opposite

------------------------------------------------------------------------------}

next :: Int -> Int
next x = if even x
         then x `div` 2
         else 3 * x + 1

-- A couple of sample executions:

-- >>> next 8
-- 4

-- >>> next 15
-- 46

-- >>> next 162
-- 81


{------------------------------------------------------------------------------

Problem 2-2
-----------

Now, we'll define the Collatz sequence; the function `collatz n` should return
the Collatz sequence beginning with `n`, and ending when you get to 1.  Remember
that you can build list using the (:) operator (pronounced "cons"):

   1 : 2 : 3 : []   ==   [1,2,3]

Here's one sample execution:

>>> collatz 5 [5,16,8,4,2,1]

Note that the result sequence starts with the input value, and includes the
final `1`.

------------------------------------------------------------------------------}

collatz :: Int -> [Int]
collatz y = if y == 1
            then [1]
            else y : collatz (next y)

-- Some sample executions

-- >>> collatz 2
-- [2,1]

-- >>> collatz 3
-- [3,10,5,16,8,4,2,1]

-- >>> collatz 7
-- [7,22,11,34,17,52,26,13,40,20,10,5,16,8,4,2,1]
