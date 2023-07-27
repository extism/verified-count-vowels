module CountVowels where

import qualified Prelude

is_vowel :: Prelude.Char -> Prelude.Bool
is_vowel b =
  case b of {
   'A' -> Prelude.True;
   'E' -> Prelude.True;
   'I' -> Prelude.True;
   'O' -> Prelude.True;
   'U' -> Prelude.True;
   'a' -> Prelude.True;
   'e' -> Prelude.True;
   'i' -> Prelude.True;
   'o' -> Prelude.True;
   'u' -> Prelude.True;
   _ -> Prelude.False}

count_vowels :: Prelude.String -> Prelude.Int
count_vowels s =
  case s of {
   ([]) -> 0;
   (:) x s' ->
    case is_vowel ((\x -> x) x) of {
     Prelude.True -> (Prelude.+) (count_vowels s') (Prelude.succ 0);
     Prelude.False -> count_vowels s'}}

