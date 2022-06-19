module TestGenerator exposing (..)

import Ark.GameIni exposing (defaultGameIni)
import Ark.Generator as Generator
import Ark.Resource
import Expect
import Test exposing (..)


suite : Test
suite =
    describe "Ark.Generator module"
        [ describe "Generator.gameIni"
            [ test "gameIni type to string" <|
                \_ ->
                    let
                        gameIni =
                            { defaultGameIni
                                | overrideItemMaxQuantities =
                                    [ { item = Ark.Resource.stone
                                      , maxQuantity = 500
                                      , ignoreMultiplier = False
                                      }
                                    , { item = Ark.Resource.fiber
                                      , maxQuantity = 1000
                                      , ignoreMultiplier = True
                                      }
                                    ]
                            }

                        expected =
                            [ "[/Script/ShooterGame.ShooterGameMode]"
                            , "ConfigOverrideItemMaxQuantity=(ItemClassString=\"" ++ Ark.Resource.stone.class ++ "\",Quantity=(MaxItemQuantity=500,bIgnoreMultiplier=false))"
                            , "ConfigOverrideItemMaxQuantity=(ItemClassString=\"" ++ Ark.Resource.fiber.class ++ "\",Quantity=(MaxItemQuantity=1000,bIgnoreMultiplier=true))"
                            ]
                                |> String.join "\n"
                    in
                    Generator.gameIni gameIni
                        |> Expect.equal expected
            ]
        ]
