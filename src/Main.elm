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
import Util.String as String


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
    | ChangeQuantity (SelectList ItemMaxQuantity) Int
    | CheckIgnoreMultiplier (SelectList ItemMaxQuantity) Bool
    | CheckAllIgnoreMultiplier Bool
    | CheckApplyChange (SelectList ItemMaxQuantity) Bool
    | CheckAllApplyChange Bool
    | CheckAllowUnlimitedRespecs Bool
    | CheckDisableStructurePlacementCollision Bool
    | ChangeMatingInterval Float
    | ChangeMatingSpeed Float
    | ChangeBabyCuddleInterval Float


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
                            (SelectList.updateSelected (I.setMaxQuantity maxQuantity) sl
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

        CheckDisableStructurePlacementCollision checked ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setDisableStructurePlacementCollision checked
            }
                |> withNone

        ChangeMatingInterval f ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setMatingIntervalMultiplier f
            }
                |> withNone

        ChangeMatingSpeed f ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setMatingSpeedMultiplier f
            }
                |> withNone

        ChangeBabyCuddleInterval f ->
            { model
                | gameIni =
                    model.gameIni
                        |> GameIni.setBabyCuddleIntervalMultiplier f
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
            [ property "gap" "0.5rem"
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
        , checkBox
            [ Attr.css
                [ property "user-select" "none"
                ]
            ]
            { label = text "建造物配置時の衝突を無効化"
            , checked = model.gameIni.disableStructurePlacementCollision
            , onCheck = CheckDisableStructurePlacementCollision
            }
        , viewSettingMatures model
        , viewSettingImprints model
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


threeColumnGrid : Attribute msg
threeColumnGrid =
    Attr.css
        [ property "display" "grid"
        , property "grid-template-columns" "1fr 1fr 1fr"
        , property "gap" "0.5rem"
        ]


viewSettingMatures : Model -> Html Msg
viewSettingMatures model =
    column div
        [ Attr.css
            [ property "gap" "0.5rem"
            ]
        ]
        [ row div
            [ threeColumnGrid
            ]
            [ text "交配可能間隔倍率"
            , input
                [ Attr.type_ "number"
                , Attr.step "0.001"
                , Attr.value <| String.fromFloat model.gameIni.matingIntervalMultiplier
                , Ev.onChange <| String.toFloat >> Maybe.withDefault model.gameIni.matingIntervalMultiplier >> ChangeMatingInterval
                ]
                []
            ]
        , row div
            [ threeColumnGrid
            ]
            [ text "交配速度倍率"
            , input
                [ Attr.type_ "number"
                , Attr.step "0.001"
                , Attr.value <| String.fromFloat model.gameIni.matingSpeedMultiplier
                , Ev.onChange <| String.toFloat >> Maybe.withDefault model.gameIni.matingSpeedMultiplier >> ChangeMatingSpeed
                ]
                []
            ]
        ]


viewSettingImprints : Model -> Html Msg
viewSettingImprints model =
    let
        defaultCuddleIntervalSeconds =
            8 * 60 * 60
    in
    column div
        [ Attr.css
            [ property "gap" "0.5rem"
            ]
        ]
        [ row div
            [ threeColumnGrid
            ]
            [ text "ケア間隔倍率"
            , input
                [ Attr.type_ "number"
                , Attr.step "0.001"
                , Attr.value <| String.fromFloat model.gameIni.babyCuddleIntervalMultiplier
                , Ev.onChange <| String.toFloat >> Maybe.withDefault model.gameIni.babyCuddleIntervalMultiplier >> ChangeBabyCuddleInterval
                ]
                []
            , text <| String.createTimeString (defaultCuddleIntervalSeconds * model.gameIni.babyCuddleIntervalMultiplier)
            ]
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
        [ threeColumnGrid
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
            , Ev.onChange <| String.toInt >> Maybe.withDefault (I.maxQuantity selected) >> ChangeQuantity sl
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
