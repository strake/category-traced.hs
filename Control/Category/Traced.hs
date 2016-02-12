module Control.Category.Traced where

import Control.Category
import Control.Category.Braided
import Control.Category.Monoidal

-- | Laws:
--
-- * Pre-naturality: @'trace' f . g = 'trace' (f . 'first' g)@
--
-- * Post-naturality: @g . 'trace' f = 'trace' ('first' g . f)@
--
-- * Dinaturality: @'trace' ('second' g . f) = 'trace' (f . 'second' g)@
--
-- TODO: figure out how to write remaining laws in Haskell syntax
class (Symmetric k p, Monoidal k p) => Traced k p where
    trace :: (p a c `k` p b c) -> (a `k` b)

instance Traced (->) (,) where
    trace f x = let (y, z) = f (x, z) in y
