let empty = []

let get store key = 
  try
    Some (List.assoc key store)
  with Not_found ->
    None

let set store key value = 
  (key, value) :: store

let dump store = 
  List.fold_left (fun s (a,b) -> a ^ ":" ^ b ^ "\n" ^ s) "" store

let set_multi store l = 
  List.fold_left (fun st (k,v) -> set st k v) store l

