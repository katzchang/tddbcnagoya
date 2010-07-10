let empty = []

let get store key = 
  try
    Some (List.assoc key store)
  with Not_found ->
    None

let set store key value = 
  (key, value) :: store

let dump store = 
  let f s (a,b) = a ^ ":" ^ b ^ "\n" ^ s
  in
  List.fold_left f "" store


