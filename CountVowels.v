Require Import String.
Require Import Ascii.
Require Import Init.Byte.

Open Scope byte_scope.
Definition is_vowel (b: byte) :=
  match b with
    | "A" | "a" | "E" | "e" | "I" | "i" | "O" | "o" | "U" | "u" => true
    | _ => false
    end.

Open Scope string_scope.
Fixpoint count_vowels (s: string) : nat :=
  match s with
  | "" => 0
  | String x s' => 
    if is_vowel (byte_of_ascii x) then count_vowels s' + 1
    else count_vowels s'
  end.


Example count_vowels_empty_0: count_vowels "" = 0.
Proof.
  unfold count_vowels.
  reflexivity.
Qed.

Example count_vowels_test: count_vowels "this is a test" = 4.
Proof.
  reflexivity.
Qed.

Example count_vowels_plus_vowel: forall x c, is_vowel c = true -> count_vowels (String (ascii_of_byte c) x) = count_vowels x + 1.
Proof.
  intros.
  induction x.
  - unfold count_vowels. rewrite byte_of_ascii_of_byte. rewrite H. reflexivity.
  - simpl. rewrite byte_of_ascii_of_byte. rewrite H. reflexivity. 
Qed.

Eval compute in count_vowels "abcdefghi".

Require Coq.extraction.Extraction.
Require Import ExtrHaskellBasic.
Require Import ExtrHaskellString.
Require Import ExtrHaskellNatInt.
Extraction Language Haskell.
Extraction "src/CountVowels.hs" count_vowels.