module Ark.ItemMaxQuantity exposing
    ( ItemMaxQuantity
    , applyChange
    , create
    , defaultItemMaxQuantities
    , ignoreMultiplier
    , item
    , maxQuantity
    , setApplyChange
    , setIgnoreMultiplier
    , setMaxQuantity
    )

import Ark.Consumable as Consumable
import Ark.Resource as Resource
import Ark.Seed as Seed
import Ark.Type exposing (Item)


type alias Internal =
    { item : Item
    , maxQuantity : Int
    , ignoreMultiplier : Bool
    , applyChange : Bool
    }


type ItemMaxQuantity
    = ItemMaxQuantity Internal


create : Internal -> ItemMaxQuantity
create =
    ItemMaxQuantity


defaultItemMaxQuantities : List ItemMaxQuantity
defaultItemMaxQuantities =
    let
        items =
            [ Resource.items
            , Consumable.items
            , Seed.items
            ]
                |> List.concat

        gen x =
            ItemMaxQuantity
                { item = x
                , maxQuantity = x.maxQuantity
                , ignoreMultiplier = False
                , applyChange = True
                }
    in
    items
        |> List.map gen


setMaxQuantity : Int -> ItemMaxQuantity -> ItemMaxQuantity
setMaxQuantity n (ItemMaxQuantity itemMaxQuantity) =
    ItemMaxQuantity
        { itemMaxQuantity
            | maxQuantity = n
        }


setIgnoreMultiplier : Bool -> ItemMaxQuantity -> ItemMaxQuantity
setIgnoreMultiplier b (ItemMaxQuantity itemMaxQuantity) =
    ItemMaxQuantity
        { itemMaxQuantity
            | ignoreMultiplier = b
        }


setApplyChange : Bool -> ItemMaxQuantity -> ItemMaxQuantity
setApplyChange b (ItemMaxQuantity itemMaxQuantity) =
    ItemMaxQuantity
        { itemMaxQuantity
            | applyChange = b
        }


item : ItemMaxQuantity -> Item
item (ItemMaxQuantity x) =
    x.item


maxQuantity : ItemMaxQuantity -> Int
maxQuantity (ItemMaxQuantity x) =
    x.maxQuantity


ignoreMultiplier : ItemMaxQuantity -> Bool
ignoreMultiplier (ItemMaxQuantity x) =
    x.ignoreMultiplier


applyChange : ItemMaxQuantity -> Bool
applyChange (ItemMaxQuantity x) =
    x.applyChange
