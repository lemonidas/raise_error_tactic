Declare ML Module "raise_error_level".

Lemma foo : 42 = 42.
  repeat (match goal with 
          | [ |- _ ] => 
            raise_error_level (assert (3 = 3) by idtac)
          end).

