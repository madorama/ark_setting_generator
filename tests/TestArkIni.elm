module TestArkIni exposing (..)

import Ark.ArkIni as ArkIni exposing (bool, int, keyValue, object, raw, string)
import Expect
import Ini
import Test exposing (..)


testToIni : Test
testToIni =
    test "create ini type" <|
        \_ ->
            let
                arkIni =
                    ArkIni.create
                        { sections =
                            [ { name = "ArkIni"
                              , values =
                                    [ keyValue "int" (int 42)
                                    , keyValue "bool" (bool True)
                                    , keyValue "str" (string "value")
                                    , object
                                        { name = "object"
                                        , values =
                                            [ keyValue "key1" (raw "value1")
                                            , keyValue "key2" (int 2)
                                            , object
                                                { name = "nestedObject"
                                                , values =
                                                    [ keyValue "k" (raw "v")
                                                    ]
                                                }
                                            ]
                                        }
                                    ]
                              }
                            ]
                        }

                expected =
                    Ini.create
                        { sections =
                            [ { name = "ArkIni"
                              , keyValues =
                                    [ ( "int", "42" )
                                    , ( "bool", "true" )
                                    , ( "str", "\"value\"" )
                                    , ( "object", "(key1=value1,key2=2,nestedObject=(k=v))" )
                                    ]
                              }
                            ]
                        }
            in
            ArkIni.toIni arkIni
                |> Expect.equal expected
