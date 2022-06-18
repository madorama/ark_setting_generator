module Madlib.Style exposing
  ( toColorCssString
  , colorLighten
  , colorDarken
  , gridTemplateAreas
  )

import Origami exposing (..)
import Color
import Color.Manipulate as Color


toColorCssString : Color.Color -> String
toColorCssString color =
  Color.toCssString color


colorLighten : Float -> Color.Color -> Color.Color
colorLighten pct =
  Color.scaleHsl
    { saturationScale = 0
    , lightnessScale = pct
    , alphaScale = 0
    }


colorDarken : Float -> Color.Color -> Color.Color
colorDarken pct =
  Color.scaleHsl
    { saturationScale = 0
    , lightnessScale = -pct
    , alphaScale = 0
    }


gridTemplateAreas : List String -> Style
gridTemplateAreas areas =
  property
    "grid-template-areas"
    (String.join "\n" (List.map (\s -> "\"" ++ s ++ "\"") areas))