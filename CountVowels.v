Require Import Ascii.
Require Import Init.Byte.
Require Import String.
Require Import Lia.

Open Scope byte_scope.

(* Check if a byte represents a vowel character *)
Definition is_vowel (b: byte) :=
  match b with
    | "A" | "a" | "E" | "e" | "I" | "i" | "O" | "o" | "U" | "u" => true
    | _ => false
    end.

(* Verify that is_vowel is true only for vowels *)
Theorem is_vowel_true_for_vowels: forall x,
  is_vowel x = true ->
    x = "A" \/ x = "a" \/
    x = "E" \/ x = "e" \/
    x = "I" \/ x = "i" \/
    x = "O" \/ x = "o" \/
    x = "U" \/ x = "u".
Proof.
  intros.
  induction x; try inversion H; intuition.
Qed.

Close Scope byte_scope.

Open Scope string_scope.


(* Count the number of vowels in a string *)
Fixpoint count_vowels (s: string) : nat :=
  match s with
  | "" => 0
  | String x s' =>
    if is_vowel (byte_of_ascii x) then count_vowels s' + 1
    else count_vowels s'
  end.

(* Sanity check*)
Example count_vowels_test: count_vowels "this is a test" = 4.
Proof.
  reflexivity.
Qed.

(* An empty string has 0 vowels *)
Example count_vowels_empty_0: count_vowels "" = 0.
Proof.
  unfold count_vowels.
  reflexivity.
Qed.

(* Verify that all strings have 0 or more vowels *)
Theorem count_vowels_always_ge_0: forall s, count_vowels s >= 0.
Proof.
  unfold ge.
  intros.
  induction s.
  - reflexivity.
  - auto with *.
Qed.

(* Verify that adding a vowel to a string increases the vowel count by 1 *)
Theorem count_vowels_plus_vowel:
  forall x c, is_vowel c = true -> count_vowels (String (ascii_of_byte c) x) = count_vowels x + 1.
Proof.
  intros.
  unfold count_vowels.
  rewrite byte_of_ascii_of_byte.
  rewrite H.
  reflexivity.
Qed.

(* Verify that adding a non-vowel doesn't increase the vowel count *)
Theorem count_vowels_plus_non_vowel:
  forall x c, is_vowel c = false -> count_vowels (String (ascii_of_byte c) x) = count_vowels x.
Proof.
  intros.
  unfold count_vowels.
  rewrite byte_of_ascii_of_byte.
  rewrite H.
  reflexivity.
Qed.

(* Verify that the number of vowels is always less than or equal to the length of the string *)
Theorem count_vowels_le_len:
  forall x, count_vowels x <= length x.
Proof.
  intros s.
  induction s.
  - simpl. lia.
  - simpl.
    destruct (is_vowel (byte_of_ascii a)) eqn:Hvowel.
    + simpl. lia.
    + simpl. lia.
Qed.

Require Coq.extraction.Extraction.
Require Import ExtrHaskellBasic.
Require Import ExtrHaskellString.
Require Import ExtrHaskellNatInt.
Extraction Language Haskell.
Extraction "src/CountVowels.hs" count_vowels.
