module Stuff exposing (..)


map : (a -> b) -> List a -> List b
map fn list =
    case list of
        [] ->
            []

        x :: xs ->
            fn x :: map fn xs


repeat : Int -> a -> List a
repeat num a =
    if num <= 0 then
        []
    else
        a :: repeat (num - 1) a


take : Int -> List a -> List a
take num list =
    if num <= 0 then
        []
    else
        case list of
            [] ->
                []

            x :: xs ->
                x :: take (num - 1) xs


reverse : List a -> List a
reverse list =
    case list of
        [] ->
            []

        x :: xs ->
            reverse xs ++ [ x ]


zip : List a -> List b -> List ( a, b )
zip uno dos =
    case ( uno, dos ) of
        ( _, [] ) ->
            []

        ( [], _ ) ->
            []

        ( x :: xs, y :: ys ) ->
            [ ( x, y ) ] ++ zip xs ys


filter : (a -> Bool) -> List a -> List a
filter fn list =
    case list of
        [] ->
            []

        x :: xs ->
            if fn x then
                x :: filter fn xs
            else
                filter fn xs


sort : List Int -> List Int
sort list =
    case list of
        [] ->
            []

        x :: xs ->
            let
                smaller =
                    sort (filter (\n -> n < x) xs)

                greater =
                    sort (filter (\n -> n > x) xs)
            in
                smaller ++ [ x ] ++ greater
