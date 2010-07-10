open OUnit
open FileStore

let _ = run_test_tt_main begin "fileStore.ml" >::: [
  "存在しないキーでgetするとNoneがかえる" >:: begin fun () ->
    assert_equal None (get empty "hoge")
  end;
  "setしたものがgetできる"  >:: begin fun () ->
    let store =
      set empty "keyfuga" "fuga"
    in
    assert_equal (Some "fuga") (get store "keyfuga")
  end;
  "空をdumpすると空文字がかえる" >:: begin fun () ->
    assert_equal "" (dump empty)
  end;
  "setされたものをdumpできる" >:: begin fun () ->
    let store = 
      set empty "A" "a"
    in
    let store' =
      set store "B" "b"
    in
    assert_equal ~printer:Std.dump "A:a\nB:b\n" (dump store')
  end;
] end
