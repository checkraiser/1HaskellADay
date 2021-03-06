module Y2017.M02.D09.Solution where

{--
Today's problem is inspired by http://rosalind.info/problems/fibo/

Fibonacci Numbers solved by 2850 as of February 8th, 2017

Problem

The Fibonacci numbers 0,1,1,2,3,5,8,13,21,34,... are generated by the following 
simple rule

F(0) = 0
F(1) = 1
F(n) = F(n-1) + F(n-2) for n > 1

Given: A positive integer n <= 25

Return: The value of F(n)
--}

sample :: Integer
sample = 6

result :: Integer
result = 8

fibo :: Integer -> Integer
fibo n | n <  1    = 0
       | n == 1    = 1
       | n >  1    = fibo (n-1) + fibo (n-2)

{--
>>> fibo sample
8
>>> fibo sample == result
True
--}

-- so here's the thing. If you defined fibo doubly-recursively, as shown above
-- you can get an answer, within a second for fibo 25. Try it.

big :: Integer
big = 25

-- what is the value of fibo big?

{-- 
>>> fibo big
75025
 ... in less than a second
--}

-- Not a problem on systems today with GHC, because GHC is that good.

{-- BONUS -----------------------------------------------------------------

but:
--}

really :: Integer
really = 100

{-- 
What is the value of fibo really?

That's a problem, isn't it, because fibo is in exponential time if defined
doubly-recursively. But here's the thing: if you know F(n) you already know
F(n-1) ... so why recompute that subtree when you've already just computed it

So, use that knowledge. Retain it. Define a fibonacci function that returns
the fibonacci at n in linear time by retaining the previous [0..n-1] fibonacci
numbers. This is what we call dynamic programming.
--}

fibr :: [Integer] -> Integer -> Integer
fibr _ 0 = 0
fibr (x:_) 1 = x
fibr fibs@(x:y:_) n = fibr (x+y:fibs) (pred n)

-- of course you need to seed your fibonacci computer for it to work. What shall
-- your seed be?

seed :: [Integer]
seed = [1,0]

-- What is the values of map (fibr seed) [sample, big, really]? 
-- Are they return timely?

{--
>>> map (fibr seed) [sample, big, really]
[8,75025,354224848179261915075]

returned with no delay.

Epilogue.

There is no law stating you couldn't've defined fibo in terms of fibr from the
get-go, knowing that binary functions can be linearized (Paul Taurau's 
binary prolog papers come to mind here). So:
--}

fibonacci :: Integer -> Integer
fibonacci = fibr seed

-- is a perfectly acceptable definition
