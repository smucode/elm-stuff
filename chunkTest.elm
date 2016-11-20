port module Main exposing (..)

import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)
import Test exposing (..)
import Expect
import Chunk exposing (..)


tests : Test
tests =
    describe "Chunk"
        [ test "even chunks" <|
            \() ->
                Expect.equal [ [ 'a', 'b' ], [ 'c', 'd' ] ]
                    (chunk 2 [ 'a', 'b', 'c', 'd' ])
        , test "uneven chunks" <|
            \() ->
                Expect.equal [ [ 'a', 'b', 'c' ], [ 'd' ] ]
                    (chunk 3 [ 'a', 'b', 'c', 'd' ])
        , test "single items" <|
            \() ->
                Expect.equal [ [ 'a' ], [ 'b' ], [ 'c' ] ]
                    (chunk 1 [ 'a', 'b', 'c' ])
        , test "single chunk" <|
            \() ->
                Expect.equal [ [ 'a' ] ]
                    (chunk 100 [ 'a' ])
        , test "zero chunk size" <|
            \() ->
                Expect.equal []
                    (chunk 0 [ 'a', 'b', 'c' ])
        ]


main : Test.Runner.Node.TestProgram
main =
    run emit tests


port emit : ( String, Value ) -> Cmd msg
