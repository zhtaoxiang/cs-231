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
      (if arg = x then t else Function(arg, (subst x v body)))
    | FunCall(fn, arg) ->
      (FunCall((subst x v fn), (subst x v arg))))



(* 3b: Implement the step function, which takes a term of type t above
and produces a new term that results from taking one step of
computation on t.  If t is a normal form, the step function should
raise the NormalForm exception declared below. *)

exception NormalForm

let rec step t = raise ImplementMe
