Declare ML Module "raise_error".

Lemma foo : 42 = 42.
  repeat (match goal with 
   | [ |- _ ] => 
     raise_error (assert (3 = 3) by idtac)
   end).

