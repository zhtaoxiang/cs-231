(* John Bender and Lorenzo Gomez, CS231 *)
(* October 8th, 2013 *)

exception NormalForm

type t = True | False | If of t * t * t | Int of int | Plus of t * t | GT of t * t

let isval t =
  match t with
      True
    | False -> true
    | Int _ -> true
    | _ -> false

(* Problem 1a.  *)

let rec step t =
  (match t with
      If(guard, thn, els) ->
        (match guard with
            True -> thn
          | False -> els
          | _ -> If(step guard, thn, els))

    | Plus(t1, t2) ->
      (match (t1, t2) with
          (Int n1, Int n2) -> Int (n1 + n2)
        | (t1, t2) ->
          if not(isval(t1))
          then Plus(step t1, t2)
          else
            (if not(isval(t2))
             then Plus(t1, step t2)
             else raise NormalForm))

    | GT(t1, t2) ->
      (match (t1, t2) with
          (Int n1, Int n2) -> (if n1 > n2 then True else False)
        | (t1, t2) ->
          if not(isval(t1))
          then GT(step t1, t2)
          else
            (if not(isval(t2))
             then GT(t1, step t2)
             else raise NormalForm))

    | _ -> raise NormalForm)


(* step(Plus(Int 1, Int 2));; *)
(* step(Plus(Plus(Int 1, Int 3), Int 2));; *)
(* step(GT(Int 1, Int 3));; *)
(* step(If(GT(Int 1, Int 3), True, False));; *)

(* Problem 1b. *)

let rec eval t =
  try eval (step t) with NormalForm -> t

(* eval(If(If(True, False, True), False, True));;  ==> true *)
(* eval(If(GT(True, Int 1), True, False));; ==> self *)
