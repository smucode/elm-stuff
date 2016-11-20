port module Main exposing (..)

import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)
import Test exposing (..)
import Expect
import Compact exposing (..)


tests : Test
tests =
    describe "Compact"
        [ test "removes Nothings" <|
            \() ->
                Expect.equal [ 1, 2, 3 ]
                    (compact [ Nothing, Just 1, Nothing, Just 2, Just 3 ])
        ]


main : Test.Runner.Node.TestProgram
main =
    run emit tests


port emit : ( String, Value ) -> Cmd msg
