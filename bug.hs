{-# LANGUAGE FlexibleInstances #-}

instance (Show a, Show b) => Show (Either a b) where
  showsPrec p (Left a)  = showParen (p >= 11) $ showString "Left " . showsPrec 11 a
  showsPrec p (Right b) = showParen (p >= 11) $ showString "Right " . showsPrec 11 b

main :: IO ()
main = do
  print (Left 1 :: Either Int String)
  print (Right "hello" :: Either Int String)