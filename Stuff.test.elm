port module Main exposing (..)

import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)
import Test exposing (Test, describe, test)
import Expect
import Stuff exposing (map, repeat, take, reverse, zip, filter, sort)


square : Int -> Int
square n =
    n * n


tests : Test
tests =
    describe "Stuff"
        [ test "Map empty" <|
            \() -> Expect.equal [] (map square [])
        , test "Map square" <|
            \() -> Expect.equal [ 1, 4, 9 ] (map square [ 1, 2, 3 ])
        , test "Repeat nums" <|
            \() -> Expect.equal [ 1, 1, 1 ] (repeat 3 1)
        , test "Take" <|
            \() -> Expect.equal [ 1, 2 ] (take 2 [ 1, 2, 3, 4, 5 ])
        , test "Take empty" <|
            \() -> Expect.equal [] (take 2 [])
        , test "Take neg" <|
            \() -> Expect.equal [] (take -2 [ 1 ])
        , test "Take neg" <|
            \() -> Expect.equal [ 1 ] (take 2 [ 1 ])
        , test "Reverse" <|
            \() -> Expect.equal [ 3, 2, 1 ] (reverse [ 1, 2, 3 ])
        , test "Zip" <|
            \() -> Expect.equal [ ( 1, 3 ), ( 2, 4 ) ] (zip [ 1, 2 ] [ 3, 4 ])
        , test "Sort" <|
            \() -> Expect.equal [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] (sort [ 5, 3, 7, 6, 1, 2, 4, 9, 8 ])
        , test "Filter" <|
            \() -> Expect.equal [ 1, 2, 3 ] (filter (\n -> n < 4) [ 1, 2, 3, 4, 5, 6 ])
        ]


main : Test.Runner.Node.TestProgram
main =
    run emit tests


port emit : ( String, Value ) -> Cmd msg
