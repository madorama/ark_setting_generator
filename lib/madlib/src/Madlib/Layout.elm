module Madlib.Layout exposing
    ( bottom
    , centerX
    , centerY
    , centering
    , column
    , columnReverse
    , gridArea
    , hero
    , rightAdjust
    , row
    , rowReverse
    )

import Origami exposing (property, with)
import Origami.Html exposing (Attribute, Html)
import Origami.Html.Attributes as Attr


rightAdjust : Attribute msg
rightAdjust =
    Attr.class "right"


bottom : Attribute msg
bottom =
    Attr.class "bottom"


centerX : Attribute msg
centerX =
    Attr.class "center-x"


centerY : Attribute msg
centerY =
    Attr.class "center-y"


centering : Attribute msg
centering =
    Attr.batchAttributes
        [ centerX
        , centerY
        ]


flexColumn :
    Bool
    -> (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
flexColumn isReverse toHtml attrs =
    toHtml
        [ Attr.css
            [ property "display" "flex"
            , property "flex-direction"
                (if isReverse then
                    "column-reverse"

                 else
                    "column"
                )
            , with ".center-x" [ property "align-items" "center" ]
            , with ".center-y" [ property "justify-content" "center" ]
            , with ".right" [ property "align-items" "flex-end" ]
            , with ".bottom" [ property "justify-content" "flex-end" ]
            ]
        , Attr.batchAttributes attrs
        ]


flexRow :
    Bool
    -> (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
flexRow isReverse toHtml attrs =
    toHtml
        [ Attr.css
            [ property "display" "flex"
            , property "flex-direction"
                (if isReverse then
                    "row-reverse"

                 else
                    "row"
                )
            , with ".center-x" [ property "justify-content" "center" ]
            , with ".center-y" [ property "align-items" "center" ]
            , with ".right" [ property "justify-content" "flex-end" ]
            , with ".bottom" [ property "align-items" "flex-end" ]
            ]
        , Attr.batchAttributes attrs
        ]


column :
    (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
column =
    flexColumn False


columnReverse :
    (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
columnReverse =
    flexColumn True


row :
    (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
row =
    flexRow False


rowReverse :
    (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
rowReverse =
    flexRow True


hero : Attribute msg
hero =
    Attr.css
        [ property "min-width" "100%"
        , property "min-height" "100vh"
        ]


gridArea :
    String
    -> (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
gridArea areaName toHtml attrs =
    toHtml
        [ Attr.css
            [ property "grid-area" areaName
            ]
        , Attr.batchAttributes attrs
        ]
