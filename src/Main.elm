module Main exposing (..)

import Ark.GameIni as GameIni exposing (GameIni, defaultGameIni)
import Ark.Generator as Generator
import Ark.ItemMaxQuantity as I exposing (ItemMaxQuantity)
import Browser exposing (Document)
import File.Download as Download
import Madlib.Html.Events as Ev
import Madlib.Layout exposing (..)
import Origami exposing (property)
import Origami.Html exposing (..)
import Origami.Html.Attributes as Attr
import Origami.Html.Events as Ev
import Response exposing (..)
import SelectList exposing (SelectList)
import Style
import Util.Html exposing (checkBox)


type alias Model =
    { gameIni : GameIni
    }


init : () -> Response Model Msg
init _ =
    { gameIni = defaultGameIni
    }
        |> withNone


type Msg
    = ClickSaveGameIni
    | ChangeQuantity (SelectList ItemMaxQuantity) String
    | CheckIgnoreMultiplier (SelectList ItemMaxQuantity) Bool
    | CheckAllIgnoreMultiplier Bool
    | CheckApplyChange (SelectList ItemMaxQuantity) Bool
    | CheckAllApplyChange Bool
    | CheckAllowUnlimitedRespecs Bool


update : Msg -> Model -> Response Model Msg
update msg model =
    case msg of
        ClickSaveGameIni ->
            model
                |> withCmd (Download.string "game.ini" "text/plain" (Generator.gameIni model.gameIni))

        ChangeQuantity sl maxQuantity ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setOverrideItemMaxQuantities
                            (SelectList.updateSelected (\x -> I.setMaxQuantity (String.toInt maxQuantity |> Maybe.withDefault (I.maxQuantity x)) x) sl
                                |> SelectList.toList
                            )
            }
                |> withNone

        CheckIgnoreMultiplier sl checked ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setOverrideItemMaxQuantities
                            (SelectList.updateSelected (I.setIgnoreMultiplier checked) sl
                                |> SelectList.toList
                            )
            }
                |> withNone

        CheckAllIgnoreMultiplier checked ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setOverrideItemMaxQuantities
                            (List.map (I.setIgnoreMultiplier checked) model.gameIni.overrideItemMaxQuantities)
            }
                |> withNone

        CheckApplyChange sl checked ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setOverrideItemMaxQuantities
                            (SelectList.updateSelected (I.setApplyChange checked) sl
                                |> SelectList.toList
                            )
            }
                |> withNone

        CheckAllApplyChange checked ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setOverrideItemMaxQuantities
                            (List.map (I.setApplyChange checked) model.gameIni.overrideItemMaxQuantities)
            }
                |> withNone

        CheckAllowUnlimitedRespecs checked ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setAllowUnlimitedRespecs checked
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
        [ checkBox
            [ Attr.css
                [ property "user-select" "none"
                ]
            ]
            { label = text "マインドワイプトニックのクールダウンを無くす"
            , checked = model.gameIni.allowUnlimitedRespecs
            , onCheck = CheckAllowUnlimitedRespecs
            }
        , row div
            []
            [ h3 []
                [ checkBox
                    [ Attr.css
                        [ property "user-select" "none"
                        ]
                    ]
                    { label = text "アイテムスタック数のオーバーライド"
                    , checked = List.all I.applyChange model.gameIni.overrideItemMaxQuantities
                    , onCheck = CheckAllApplyChange
                    }
                ]
            , checkBox
                [ centerY
                , Attr.css
                    [ property "user-select" "none"
                    ]
                ]
                { label = text "全てのスタックサイズ倍率を無視する"
                , checked = List.all I.ignoreMultiplier model.gameIni.overrideItemMaxQuantities
                , onCheck = CheckAllIgnoreMultiplier
                }
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
        (SelectList.selectedMapForList viewItemMaxQuantity model.gameIni.overrideItemMaxQuantities)


viewItemMaxQuantity : SelectList ItemMaxQuantity -> Html Msg
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
        [ checkBox
            [ centerY
            ]
            { label = text <| (I.item selected).name
            , checked = I.applyChange selected
            , onCheck = CheckApplyChange sl
            }
        , input
            [ Attr.value <| String.fromInt (I.maxQuantity selected)
            , Attr.type_ "number"
            , Attr.css
                [ property "padding" "0.25rem"
                ]
            , Ev.onChange (ChangeQuantity sl)
            ]
            []
        , checkBox
            [ centerY
            , Attr.css
                [ property "user-select" "none"
                ]
            ]
            { label = text "スタックサイズ倍率を無視する"
            , checked = I.ignoreMultiplier selected
            , onCheck = CheckIgnoreMultiplier sl
            }
        ]


main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
