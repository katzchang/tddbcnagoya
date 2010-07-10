open OUnit
open FileStore

let _ = run_test_tt_main begin "fileStore.ml" >::: [
  "存在しないキーでgetするとNoneがかえる" >:: begin fun () ->
    assert_equal None (get empty "hoge")
  end
] end

