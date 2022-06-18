module Madlib.Html.Events exposing (..)

import Json.Decode as JD
import Origami.Html exposing (Attribute)
import Origami.Html.Events as Ev


onChange : (String -> msg) -> Attribute msg
onChange f =
    Ev.on "change" <| JD.map f (JD.at [ "target", "value" ] JD.string)
