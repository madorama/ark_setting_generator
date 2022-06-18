module Util.String exposing (fromBool)


fromBool : Bool -> String
fromBool b =
    if b then
        "true"

    else
        "false"
