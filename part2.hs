----------------------------------------
-- (a, a) === Bool -> a
----------------------------------------

to :: (a, a) -> (Bool -> a)
to (a, b) = (\x -> if x then a else b)

from :: (Bool -> a) -> (a, a)
from f = (f True, f False)
