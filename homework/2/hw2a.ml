exception ImplementMe

(* Problem 3 *)

(* Type t represents abstract syntax trees for the lambda calculus.  A
variable name is represented as an OCaml string. We include the value
True so that you have a simple value to use for testing purposes.

Example: the term ((function x -> x) true) would be represented as follows:

   FunCall(Function("x", Var "x"), True)

*)

type t = True | Var of string | Function of string * t | FunCall of t * t

(* 3a: Implement the subst function below, which substitutes a given
   value v for all free occurrences of the variable named x in term t,
   returning the resulting term. You may assume that v has no free
   variables. *)

let rec subst (x:string) (v:t) (t:t) =
  (match t with
      True -> True
    | Var name ->
      (if name = x then v else t)
    | Function(arg, body) ->
      (* NOTE: if x is the named param of the function it's not free and we can stop,
               otherwise we need to proceed and check for substitutions in subterms *)
      (if arg = x then t else Function(arg, (subst x v body)))
    | FunCall(l, r) ->
      (FunCall((subst x v l), (subst x v r))))

(* 3b: Implement the step function, which takes a term of type t above
and produces a new term that results from taking one step of
computation on t.  If t is a normal form, the step function should
raise the NormalForm exception declared below. *)

exception NormalForm

let rec step t =
  (match t with
      True -> raise NormalForm
    | Var(_) -> raise NormalForm
    | Function(_, _) -> raise NormalForm
    | FunCall(Function(var, body), arg) ->
      (try
        (* if the `step arg` throws a NormalForm subst otherwise it stepped *)
        (FunCall(Function(var, body), step arg))
      with NormalForm ->
        (subst var arg body))
    | FunCall(l, r) -> FunCall(step l, r))

(* FunCall(Function("x", Var "x"), FunCall(Function("x", Var "x"), True)) =>
     FunCall (Function ("x", Var "x"), True) *)
(* FunCall (Function ("x", Var "x"), True) => True *)
