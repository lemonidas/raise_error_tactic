DECLARE PLUGIN "raise_error"

open Pp
open Constrarg
open Names

let raise_error (t : Geninterp.Val.t) = 
  let tac = Tacinterp.tactic_of_value (Tacinterp.default_ist ()) t in
  Proofview.Goal.enter { enter = begin fun gl ->
    Proofview.tclIFCATCH tac
      (fun _ -> Tacticals.New.tclIDTAC)
      (fun e -> Util.iraise e; Tacticals.New.tclIDTAC)
  end }


TACTIC EXTEND raise_error
  | ["raise_error" tactic(t)] -> [ raise_error t ]
END;;

