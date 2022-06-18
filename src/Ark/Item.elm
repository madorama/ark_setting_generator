module Ark.Item exposing (..)

import Ark.Consumable as Consumable
import Ark.Resource as Resource
import Ark.Seed as Seed
import Ark.Type exposing (Item)


type alias ItemMaxQuantity =
    { item : Item
    , maxQuantity : Int
    , ignoreMultiplier : Bool
    }


defaultItemMaxQuantities : List ItemMaxQuantity
defaultItemMaxQuantities =
    let
        items =
            [ Resource.items
            , Consumable.items
            , Seed.items
            ]
                |> List.concat

        gen item =
            { item = item
            , maxQuantity = item.maxQuantity
            , ignoreMultiplier = False
            }
    in
    items
        |> List.map gen
