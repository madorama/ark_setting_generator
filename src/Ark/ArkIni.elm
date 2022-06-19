module Ark.ArkIni exposing
    ( ArkIni
    , ArkObject
    , ArkObjectValue
    , Value
    , bool
    , create
    , float
    , int
    , keyValue
    , object
    , raw
    , string
    , toIni
    )

import FormatNumber
import FormatNumber.Locales exposing (Decimals(..), usLocale)
import Ini
import Util.String as String


type Value
    = VBool Bool
    | VInt Int
    | VFloat Float
    | VString String
    | VRaw String


bool : Bool -> Value
bool =
    VBool


int : Int -> Value
int =
    VInt


float : Float -> Value
float =
    VFloat


string : String -> Value
string =
    VString


raw : String -> Value
raw =
    VRaw


type ArkObjectValue
    = KeyValue String Value
    | Object ArkObject


keyValue =
    KeyValue


object : ArkObject -> ArkObjectValue
object =
    Object


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

        VFloat f ->
            FormatNumber.format
                { usLocale
                    | decimals = Exact 6
                    , thousandSeparator = ""
                }
                f

        VString s ->
            "\"" ++ s ++ "\""

        VRaw s ->
            s
