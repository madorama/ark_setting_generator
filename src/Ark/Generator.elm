module Ark.Generator exposing (gameIni)

import Ark.GameIni exposing (GameIni)
import Ark.Item exposing (ItemMaxQuantity)
import Util.String as String


generateConfigOverrideItemMaxQuantity : ItemMaxQuantity -> String
generateConfigOverrideItemMaxQuantity itemMaxQuantity =
    let
        quantity =
            [ "Quantity=("
            , "MaxItemQuantity=" ++ String.fromInt itemMaxQuantity.maxQuantity ++ ","
            , "bIgnoreMultiplier=" ++ String.fromBool itemMaxQuantity.ignoreMultiplier
            , ")"
            ]
                |> String.join ""
    in
    [ "ConfigOverrideItemMaxQuantity=("
    , "ItemClassString=\"" ++ itemMaxQuantity.item.class ++ "\","
    , quantity
    , ")"
    ]
        |> String.join ""


gameIni : GameIni -> String
gameIni data =
    [ "[/Script/ShooterGame.ShooterGameMode]"
    , List.map generateConfigOverrideItemMaxQuantity data.overrideItemMaxQuantities
        |> String.join "\n"
    ]
        |> String.join "\n"
