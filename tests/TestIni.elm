module TestIni exposing (..)

import Expect
import Ini
import Test exposing (..)


suite : Test
suite =
    describe "Ini module"
        [ describe "Ini.toString"
            [ test "ini type to string" <|
                \_ ->
                    let
                        ini =
                            Ini.create
                                { sections =
                                    [ { name = "Section1"
                                      , keyValues =
                                            [ ( "key1", "value1" )
                                            , ( "key2", "value2" )
                                            ]
                                      }
                                    , { name = "Section2"
                                      , keyValues =
                                            [ ( "key3", "value3" )
                                            ]
                                      }
                                    ]
                                }

                        expected =
                            [ "[Section1]"
                            , "key1=value1"
                            , "key2=value2"
                            , ""
                            , "[Section2]"
                            , "key3=value3"
                            ]
                                |> String.join "\n"
                    in
                    Ini.toString ini
                        |> Expect.equal expected
            ]
        ]
