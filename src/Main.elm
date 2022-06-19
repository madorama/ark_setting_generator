module Main exposing (..)

import Ark.GameIni exposing (GameIni, defaultGameIni)
import Ark.Generator as Generator
import Ark.Item as Item exposing (ItemMaxQuantity)
import Browser exposing (Document)
import File.Download as Download
import Madlib.Html.Events as Ev
import Madlib.Layout exposing (..)
import Madlib.Style exposing (gridTemplateAreas)
import Origami exposing (batch, noStyle, property, with)
import Origami.Html exposing (..)
import Origami.Html.Attributes as Attr
import Origami.Html.Events as Ev
import Response exposing (..)
import SelectList exposing (SelectList)
import Style


type alias Model =
    { itemMaxQuantities : List ItemMaxQuantity
    }


init : () -> Response Model Msg
init _ =
    { itemMaxQuantities = Item.defaultItemMaxQuantities
    }
        |> withNone


type Msg
    = ClickSaveGameIni
    | ChangeQuantity (SelectList ItemMaxQuantity) String
    | CheckIgnoreMultiplier (SelectList ItemMaxQuantity) Bool
    | CheckAllIgnoreMultiplier Bool
    | CheckApplyChange (SelectList ItemMaxQuantity) Bool
    | CheckAllApplyChange Bool


generateGameIni : Model -> GameIni
generateGameIni model =
    { defaultGameIni
        | overrideItemMaxQuantities = model.itemMaxQuantities
    }


updateMaxQuantity : Int -> ItemMaxQuantity -> ItemMaxQuantity
updateMaxQuantity n itemMaxQuantity =
    { itemMaxQuantity
        | maxQuantity = n
    }


updateIgnoreMultiplier : Bool -> ItemMaxQuantity -> ItemMaxQuantity
updateIgnoreMultiplier b itemMaxQuantity =
    { itemMaxQuantity
        | ignoreMultiplier = b
    }


updateApplyChange : Bool -> ItemMaxQuantity -> ItemMaxQuantity
updateApplyChange b itemMaxQuantity =
    { itemMaxQuantity
        | applyChange = b
    }


update : Msg -> Model -> Response Model Msg
update msg model =
    case msg of
        ClickSaveGameIni ->
            model
                |> withCmd (Download.string "game.ini" "text/plain" (Generator.gameIni <| generateGameIni model))

        ChangeQuantity sl maxQuantity ->
            { model
                | itemMaxQuantities =
                    SelectList.updateSelected (\x -> updateMaxQuantity (String.toInt maxQuantity |> Maybe.withDefault x.maxQuantity) x) sl
                        |> SelectList.toList
            }
                |> withNone

        CheckIgnoreMultiplier sl checked ->
            { model
                | itemMaxQuantities =
                    SelectList.updateSelected (updateIgnoreMultiplier checked) sl
                        |> SelectList.toList
            }
                |> withNone

        CheckAllIgnoreMultiplier checked ->
            { model
                | itemMaxQuantities =
                    List.map (updateIgnoreMultiplier checked) model.itemMaxQuantities
            }
                |> withNone

        CheckApplyChange sl checked ->
            { model
                | itemMaxQuantities =
                    SelectList.updateSelected (updateApplyChange checked) sl
                        |> SelectList.toList
            }
                |> withNone

        CheckAllApplyChange checked ->
            { model
                | itemMaxQuantities =
                    List.map (updateApplyChange checked) model.itemMaxQuantities
            }
                |> withNone


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Document Msg
view model =
    { title = "ARK Setting Generator"
    , body =
        [ column div
            [ hero
            , Attr.css [ Style.style ]
            ]
            [ viewMain model ]
            |> toHtml
        ]
    }


viewMain : Model -> Html Msg
viewMain model =
    column div
        [ hero
        , Attr.css
            [ property "padding" "0.5rem"
            , property "gap" "0.5rem"
            ]
        ]
        [ h1
            []
            [ text "ARK Setting Generator" ]
        , button
            [ Ev.onClick ClickSaveGameIni
            ]
            [ text "Game.iniを保存" ]
        , viewSettings model
        ]


viewSettings : Model -> Html Msg
viewSettings model =
    column div
        [ Attr.css
            [ property "gap" "1rem"
            ]
        ]
        [ row div
            []
            [ h3 []
                [ label
                    [ Attr.css
                        [ property "user-select" "none"
                        ]
                    ]
                    [ input
                        [ Attr.type_ "checkbox"
                        , Attr.checked (List.all .applyChange model.itemMaxQuantities)
                        , Ev.onCheck CheckAllApplyChange
                        ]
                        []
                    , text "アイテムスタック数のオーバーライド"
                    ]
                ]
            , row label
                [ centerY
                , Attr.css
                    [ property "user-select" "none"
                    ]
                ]
                [ input
                    [ Attr.type_ "checkbox"
                    , Attr.checked (List.all .ignoreMultiplier model.itemMaxQuantities)
                    , Ev.onCheck CheckAllIgnoreMultiplier
                    ]
                    []
                , text "全てのスタックサイズ倍率を無視する"
                ]
            ]
        , viewItemMaxQuantities model
        ]


viewItemMaxQuantities : Model -> Html Msg
viewItemMaxQuantities model =
    column div
        [ Attr.css
            [ property "gap" "0.5rem"
            ]
        ]
        (SelectList.selectedMapForList viewItemMaxQuantity model.itemMaxQuantities)


viewItemMaxQuantity : SelectList Item.ItemMaxQuantity -> Html Msg
viewItemMaxQuantity sl =
    let
        selected =
            SelectList.selected sl
    in
    row div
        [ Attr.css
            [ property "gap" "0.5rem"
            , property "display" "grid"
            , property "grid-template-columns" "1fr 1fr 1fr"
            ]
        ]
        [ row label
            [ centerY
            ]
            [ input
                [ Attr.type_ "checkbox"
                , Attr.checked selected.applyChange
                , Ev.onCheck (CheckApplyChange sl)
                ]
                []
            , text selected.item.name
            ]
        , input
            [ Attr.value <| String.fromInt selected.maxQuantity
            , Attr.type_ "number"
            , Attr.css
                [ property "padding" "0.25rem"
                ]
            , Ev.onChange (ChangeQuantity sl)
            ]
            []
        , row label
            [ centerY
            , Attr.css
                [ property "user-select" "none"
                ]
            ]
            [ input
                [ Attr.type_ "checkbox"
                , Attr.checked selected.ignoreMultiplier
                , Ev.onCheck (CheckIgnoreMultiplier sl)
                ]
                []
            , text "スタックサイズ倍率を無視する"
            ]
        ]


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
