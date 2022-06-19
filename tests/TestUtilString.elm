module TestUtilString exposing (..)

import Expect
import Test exposing (..)
import Util.String as String


suite : Test
suite =
    describe "Util.String module"
        [ describe "String.fromBool"
            [ test "True to \"true\"" <|
                \_ ->
                    String.fromBool True
                        |> Expect.equal "true"
            , test "False to \"false\"" <|
                \_ ->
                    String.fromBool False
                        |> Expect.equal "false"
            ]
        ]
