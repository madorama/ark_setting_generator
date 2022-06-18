module Style exposing (..)

import Origami exposing (Style, property, with)


style : Style
style =
    with " "
        [ with "input"
            [ property "border" "1px solid #888"
            ]
        , with "button"
            [ property "border" "none"
            , property "border-radius" "2px"
            , property "cursor" "pointer"
            , property "padding" "1rem"
            , property "color" "#f0f0f0"
            , property "background-color" "#17f"
            , property "font-weight" "700"
            , property "transition" ".1s"
            , with ":hover"
                [ property "background-color" "#06e"
                ]
            ]
        ]
