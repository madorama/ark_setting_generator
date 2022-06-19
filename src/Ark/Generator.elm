module Ark.Generator exposing (gameIni)

import Ark.ArkIni as ArkIni exposing (ArkIni, ArkObjectValue(..), Value(..))
import Ark.GameIni exposing (GameIni)
import Ark.Item exposing (ItemMaxQuantity)
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
                    [ data.overrideItemMaxQuantities
                        |> List.filter .applyChange
                        |> List.map toConfigOverrideItemMaxQuantity
                    ]
                        |> List.concat
              }
            ]
        }


toConfigOverrideItemMaxQuantity : ItemMaxQuantity -> ArkObjectValue
toConfigOverrideItemMaxQuantity itemMaxQuantity =
    Object
        { name = "ConfigOverrideItemMaxQuantity"
        , values =
            [ KeyValue "ItemClassString" (VString itemMaxQuantity.item.class)
            , Object
                { name = "Quantity"
                , values =
                    [ KeyValue "MaxItemQuantity" (VInt itemMaxQuantity.maxQuantity)
                    , KeyValue "bIgnoreMultiplier" (VBool itemMaxQuantity.ignoreMultiplier)
                    ]
                }
            ]
        }
