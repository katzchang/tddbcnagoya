let empty = []

let get store key = 
  try
    Some (List.assoc key store)
  with Not_found ->
    None

let rec option_concat : 'a option list -> 'a list =
  function 
    | [] -> []
    | Some x :: tl -> x :: option_concat tl
    | None :: tl -> option_concat tl

let set store key value = 
  (key, value) :: store

let dump store = 
  List.fold_left (fun s (a,b) -> a ^ ":" ^ b ^ "\n" ^ s) "" store

let set_multi store l = 
  List.fold_left (fun st (k,v) -> set st k v) store l

let get_multi store ks = 
  let vs = List.map (fun k -> get store k) ks in
  option_concat vs
