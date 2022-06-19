module Ini exposing
    ( Ini
    , KeyValue
    , create
    , toString
    )


type alias KeyValue =
    ( String, String )


type alias Section =
    { name : String
    , keyValues : List KeyValue
    }


type Ini
    = Ini
        { sections : List Section
        }


create : { sections : List Section } -> Ini
create =
    Ini


toString : Ini -> String
toString (Ini ini) =
    ini.sections
        |> List.map generateSection
        |> String.join "\n\n"


generateSection : Section -> String
generateSection section =
    [ [ "[" ++ section.name ++ "]" ]
    , section.keyValues
        |> List.map generateKeyValue
    ]
        |> List.concat
        |> String.join "\n"


generateKeyValue : ( String, String ) -> String
generateKeyValue ( key, value ) =
    key ++ "=" ++ value
