module Util.Html exposing (checkBox)

import Madlib.Layout exposing (..)
import Origami.Html exposing (..)
import Origami.Html.Attributes as Attr
import Origami.Html.Events as Ev


type alias CheckBoxOption msg =
    { label : Html msg
    , checked : Bool
    , onCheck : Bool -> msg
    }


checkBox : List (Attribute msg) -> CheckBoxOption msg -> Html msg
checkBox attrs opt =
    row label
        attrs
        [ input
            [ Attr.type_ "checkbox"
            , Attr.checked opt.checked
            , Ev.onCheck opt.onCheck
            ]
            []
        , opt.label
        ]
