module Ark.Generator exposing (gameIni)

import Ark.ArkIni as ArkIni exposing (ArkIni, ArkObjectValue, bool, float, int, keyValue, object, string)
import Ark.GameIni exposing (GameIni)
import Ark.ItemMaxQuantity as I exposing (ItemMaxQuantity)
import Ini exposing (KeyValue)


gameIni : GameIni -> String
gameIni data =
    toArkGameIni data
        |> ArkIni.toIni
        |> Ini.toString


toArkGameIni : GameIni -> ArkIni
toArkGameIni data =
    ArkIni.create
        { sections =
            [ { name = "/Script/ShooterGame.ShooterGameMode"
              , values =
                    [ [ keyValue "bAllowUnlimitedRespecs" (bool data.allowUnlimitedRespecs)
                      , keyValue "bDisableStructurePlacementCollision" (bool data.disableStructurePlacementCollision)
                      , keyValue "MatingIntervalMultiplier" (float data.matingIntervalMultiplier)
                      , keyValue "MatingSpeedMultiplier" (float data.matingSpeedMultiplier)
                      , keyValue "BabyCuddleIntervalMultiplier" (float data.babyCuddleIntervalMultiplier)
                      ]
                    , data.overrideItemMaxQuantities
                        |> List.filter I.applyChange
                        |> List.map toConfigOverrideItemMaxQuantity
                    ]
                        |> List.concat
              }
            ]
        }


toConfigOverrideItemMaxQuantity : ItemMaxQuantity -> ArkObjectValue
toConfigOverrideItemMaxQuantity itemMaxQuantity =
    ArkIni.object
        { name = "ConfigOverrideItemMaxQuantity"
        , values =
            [ keyValue "ItemClassString" (string (I.item itemMaxQuantity).class)
            , object
                { name = "Quantity"
                , values =
                    [ keyValue "MaxItemQuantity" (int <| I.maxQuantity itemMaxQuantity)
                    , keyValue "bIgnoreMultiplier" (bool <| I.ignoreMultiplier itemMaxQuantity)
                    ]
                }
            ]
        }
