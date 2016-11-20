module Compact exposing (..)


compact : List (Maybe a) -> List a
compact list =
    case list of
        [] ->
            []

        x :: xs ->
            case x of
                Nothing ->
                    compact xs

                Just x ->
                    x :: compact xs
