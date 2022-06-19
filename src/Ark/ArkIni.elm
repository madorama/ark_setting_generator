module Ark.ArkIni exposing
    ( ArkIni
    , ArkObject
    , ArkObjectValue(..)
    , Value(..)
    , create
    , toIni
    )

import Ini
import Util.String as String


type Value
    = VBool Bool
    | VInt Int
    | VString String
    | VRaw String


type ArkObjectValue
    = KeyValue String Value
    | Object ArkObject


type alias ArkObject =
    { name : String
    , values : List ArkObjectValue
    }


type ArkIni
    = ArkIni
        { sections :
            List
                { name : String
                , values : List ArkObjectValue
                }
        }


create : { sections : List { name : String, values : List ArkObjectValue } } -> ArkIni
create =
    ArkIni


toIni : ArkIni -> Ini.Ini
toIni (ArkIni arkIni) =
    Ini.create
        { sections =
            List.map (\x -> { name = x.name, keyValues = List.map arkObjectValueToKeyValue x.values }) arkIni.sections
        }


objectValuesToString : List ArkObjectValue -> String
objectValuesToString values =
    "(" ++ (List.map arkObjectValueToString values |> String.join ",") ++ ")"


arkObjectValueToKeyValue : ArkObjectValue -> Ini.KeyValue
arkObjectValueToKeyValue v =
    case v of
        KeyValue k val ->
            ( k, valueToString val )

        Object o ->
            ( o.name
            , objectValuesToString o.values
            )


arkObjectValueToString : ArkObjectValue -> String
arkObjectValueToString arkObjectValue =
    case arkObjectValue of
        KeyValue k val ->
            k ++ "=" ++ valueToString val

        Object o ->
            o.name ++ "=" ++ objectValuesToString o.values


valueToString : Value -> String
valueToString v =
    case v of
        VBool b ->
            String.fromBool b

        VInt n ->
            String.fromInt n

        VString s ->
            "\"" ++ s ++ "\""

        VRaw s ->
            s
