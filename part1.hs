{-# OPTIONS_GHC -Wall #-}

-- Addition
data Add a b = AddL a | AddR b deriving (Show)

-- Multiplication
data Mul a b = Mul a b deriving (Show)

-- Zero
data Void

----------------------------------------
---------- LAWS FOR SUM TYPES ----------
----------------------------------------

----------------------------------------
-- Add Void a === a
----------------------------------------

--to :: Add Void a -> a
--to (AddR a) = a
---- The are no values of type Void, so I don't need 
---- (nor can) to match (AddL _)
--
--from :: a -> Add Void a
--from a = AddR a

----------------------------------------
-- Add a b === Add b a
----------------------------------------

--to :: Add a b -> Add b a
--to (AddL a) = AddR a
--to (AddR b) = AddL b
--
--from :: Add b a -> Add a b
--from = to

--------------------------------------------
---------- LAWS FOR PRODUCT TYPES ----------
--------------------------------------------

--------------------------------------------
-- Mul Void a === Void
--------------------------------------------

-- I'm not sure about this one. My argument would be that, since there
-- are no values of type Void, there can't be values of type Mul Void a.
-- So, both types have the same number of values (zero) and so they're
-- equivalent

--------------------------------------------
-- Mul () a === a
--------------------------------------------

--to :: Mul () a -> a
--to (Mul _ a) = a
--
--from :: a -> Mul () a
--from a = Mul () a

--------------------------------------------
-- Mul a b === Mul b a
--------------------------------------------

--to :: Mul a b -> Mul b a
--to (Mul a b) = Mul b a
--
--from :: Mul b a -> Mul a b
--from = to

----------------------------------------
---------- LAWS FOR FUNCTIONS ----------
----------------------------------------

----------------------------------------
-- () -> a === a
----------------------------------------

--to :: (() -> a) -> a
--to f = f ()
--
--from :: a -> (() -> a)
--from a = (\_ -> a)

----------------------------------------
-- a -> () === ()
----------------------------------------

--to :: (a -> ()) -> ()
--to _ = ()
--
--from :: () -> (a -> ())
--from () = (\_ -> ())

----------------------------------------
-- (a -> b, a -> c) === a -> (b, c)
----------------------------------------

to :: (a -> b, a -> c) -> (a -> (b, c))
to (f, g) = (\a -> (f a, g a))

from :: (a -> (b, c)) -> (a -> b, a -> c)
from f = (fst . f, snd . f)

--TODO Add tests
