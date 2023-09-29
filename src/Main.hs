module Main where

import CountVowels
import Extism.PDK
import Extism.PDK.JSON

countVowels :: IO ()
countVowels = do
  -- Get input string from Extism host
  s <- input
  -- Calculate the number of vowels
  let count = count_vowels s
  -- Return a JSON object {"count": count} back to the host
  output $ (JSONValue $ object ["count" .= count])

main :: IO ()
main = countVowels

foreign export ccall "count_vowels" countVowels ::  IO ()
