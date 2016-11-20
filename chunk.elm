module Chunk exposing (..)


chunk_ : Int -> List a -> List a -> List (List a) -> List (List a)
chunk_ chunkSize list chunk chunks =
    case list of
        [] ->
            chunks ++ [ chunk ]

        x :: xs ->
            if List.length chunk >= chunkSize then
                chunk_ chunkSize xs [ x ] (chunks ++ [ chunk ])
            else
                chunk_ chunkSize xs (chunk ++ [ x ]) chunks


chunk : Int -> List a -> List (List a)
chunk chunkSize list =
    if chunkSize <= 0 then
        []
    else
        chunk_ chunkSize list [] []
