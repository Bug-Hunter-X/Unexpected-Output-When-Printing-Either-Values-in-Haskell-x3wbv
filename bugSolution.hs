{-# LANGUAGE FlexibleInstances #-}

instance (Show a, Show b) => Show (Either a b) where
  showsPrec p (Left a)  = showParen (p >= 11) $ showString "Left " . showsPrec 11 a
  showsPrec p (Right b) = showParen (p >= 11) $ showString "Right " . showsPrec 11 b

main :: IO ()
main = do
  print (Left 1 :: Either Int String)
  print (Right "hello" :: Either Int String)

--The issue was not in the code itself but in a misunderstanding of Haskell's type system and the default Show instance.  The provided code is correct.  Any problems were likely from a user not explicitly defining the Show instance leading to unexpected default behavior depending on type parameters a and b. For robust and consistent output, always explicitly define the Show instance for custom data types or types involved in more complex scenarios like this.