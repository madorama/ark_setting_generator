module Ark.Generator exposing (gameIni)

import Ark.ArkIni as ArkIni exposing (ArkIni, ArkObjectValue(..), Value(..))
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
                    [ [ KeyValue "bAllowUnlimitedRespecs" (VBool data.allowUnlimitedRespecs)
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
    Object
        { name = "ConfigOverrideItemMaxQuantity"
        , values =
            [ KeyValue "ItemClassString" (VString (I.item itemMaxQuantity).class)
            , Object
                { name = "Quantity"
                , values =
                    [ KeyValue "MaxItemQuantity" (VInt <| I.maxQuantity itemMaxQuantity)
                    , KeyValue "bIgnoreMultiplier" (VBool <| I.ignoreMultiplier itemMaxQuantity)
                    ]
                }
            ]
        }
