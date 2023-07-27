module Main where

import CountVowels
import Extism.PDK
import Extism.PDK.JSON

countVowels = do
  -- Get input string from Extism host
  s <- inputString
  -- Calculate the number of vowels
  let count = count_vowels s
  -- Return a JSON object {"count": count} back to the host
  outputJSON $ object ["count" .= count]

main = countVowels

foreign export ccall "count_vowels" countVowels ::  IO ()
