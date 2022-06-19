module TestGenerator exposing (..)

import Ark.GameIni exposing (defaultGameIni)
import Ark.Generator as Generator
import Ark.Resource
import Expect
import Test exposing (..)


testGameIni : Test
testGameIni =
    test "gameIni type to string" <|
        \_ ->
            let
                gameIni =
                    { defaultGameIni
                        | overrideItemMaxQuantities =
                            [ { item = Ark.Resource.stone
                              , maxQuantity = 500
                              , ignoreMultiplier = False
                              , applyChange = True
                              }
                            , { item = Ark.Resource.fiber
                              , maxQuantity = 1000
                              , ignoreMultiplier = True
                              , applyChange = True
                              }
                            , { item = Ark.Resource.blackPearl
                              , maxQuantity = 1
                              , ignoreMultiplier = False
                              , applyChange = False
                              }
                            ]
                    }

                expected =
                    [ "[/Script/ShooterGame.ShooterGameMode]"
                    , "bAllowUnlimitedRespecs=false"
                    , "ConfigOverrideItemMaxQuantity=(ItemClassString=\"" ++ Ark.Resource.stone.class ++ "\",Quantity=(MaxItemQuantity=500,bIgnoreMultiplier=false))"
                    , "ConfigOverrideItemMaxQuantity=(ItemClassString=\"" ++ Ark.Resource.fiber.class ++ "\",Quantity=(MaxItemQuantity=1000,bIgnoreMultiplier=true))"
                    ]
                        |> String.join "\n"
            in
            Generator.gameIni gameIni
                |> Expect.equal expected
