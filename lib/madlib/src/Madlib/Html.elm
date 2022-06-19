module Madlib.Html exposing (..)

import Origami.Html exposing (Html, text)


none : Html msg
none =
    text ""


when : Bool -> Html msg -> Html msg
when c html =
    if c then
        html

    else
        none


unless : Bool -> Html msg -> Html msg
unless =
    not >> when


maybe : Maybe a -> (a -> Html msg) -> Html msg
maybe m f =
    m
        |> Maybe.map f
        |> Maybe.withDefault none
