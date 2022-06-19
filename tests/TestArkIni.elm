module TestArkIni exposing (..)

import Ark.ArkIni as ArkIni exposing (ArkObjectValue(..), Value(..))
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
                                    [ KeyValue "int" (VInt 42)
                                    , KeyValue "bool" (VBool True)
                                    , KeyValue "str" (VString "value")
                                    , Object
                                        { name = "object"
                                        , values =
                                            [ KeyValue "key1" (VRaw "value1")
                                            , KeyValue "key2" (VInt 2)
                                            , Object
                                                { name = "nestedObject"
                                                , values =
                                                    [ KeyValue "k" (VRaw "v")
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
