#use "compiler.ml";;

let ensure_output_dir output_file =
  let dir = Filename.dirname output_file in
  if dir <> "." && not (Sys.file_exists dir) then
    let command = Printf.sprintf "mkdir -p %s" (Filename.quote dir) in
    match Sys.command command with
    | 0 -> ()
    | code ->
        Printf.eprintf "Failed to create output directory %s (exit %d)\n" dir code;
        exit code;;

let usage () =
  prerr_endline "Usage: ocaml compile.ml <input.scm> <output.asm>";
  exit 2;;

let () =
  match Array.to_list Sys.argv with
  | [_; input_file; output_file] ->
      ensure_output_dir output_file;
      Code_Generation.compile_scheme_file input_file output_file
  | _ -> usage ();;
