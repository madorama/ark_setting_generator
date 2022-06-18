module Madlib.Html.Attribute exposing (..)

import Origami.Html exposing (Attribute)
import Origami.Html.Attributes as Attr


openNewTab : Attribute msg
openNewTab =
  Attr.batchAttributes
    [ Attr.target "_blank"
    , Attr.rel "noopener noreferrer"
    ]


when : Bool -> Attribute msg -> Attribute msg
when c attr =
  if c then
    attr

  else
    Attr.noAttribute


unless : Bool -> Attribute msg -> Attribute msg
unless =
  not >> when


maybe : Maybe a -> (a -> Attribute msg) -> Attribute msg
maybe m f =
  m
    |> Maybe.map f
    |> Maybe.withDefault Attr.noAttribute