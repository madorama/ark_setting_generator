module Ark.GameIni exposing (..)

import Ark.ItemMaxQuantity as Item exposing (ItemMaxQuantity)


type alias GameIni =
    { overrideItemMaxQuantities : List ItemMaxQuantity
    , allowUnlimitedRespecs : Bool
    , globalItemDecompositionTimeMultiplier : Float
    , pveDisableFriendlyFire : Bool
    , disableFriendlyFire : Bool
    , flyerPlatformAllowUnalignedDinoBasing : Bool
    , matingIntervalMultiplier : Float
    , matingSpeedMultiplier : Float
    , eggHatchSpeedMultiplier : Float
    , babyMatureSpeedMultiplier : Float
    , babyFoodConsumptionSpeedMultiplier : Float
    , babyImprintingStatScaleMultiplier : Float
    , babyImprintAmountMultiplier : Float
    , babyCuddleIntervalMultiplier : Float
    , babyCuddleGracePeriodMultiplier : Float
    , babyCuddleLoseImprintQualitySpeedMultiplier : Float
    , layEggIntervalMultiplier : Float
    , poopIntervalMultiplier : Float
    , cropGrowthSpeedMultiplier : Float
    , cropDecaySpeedMultiplier : Float
    , hairGrowthSpeedMultiplier : Float
    , structureDamageRepairCooldown : Int
    , customRecipeEffectivenessMultiplier : Float
    , customRecipeSkillMultiplier : Float
    , dinoHarvestingDamageMultiplier : Float
    , playerHarvestingDamageMultiplier : Float
    , supplyCrateLootQualityMultiplier : Float
    , fishingLootQualityMultiplier : Float
    , maxTribeLogs : Int
    , disableStructurePlacementCollision : Bool
    , autoUnlockAllEngrams : Bool
    , allowCustomRecipes : Bool
    , passiveTameIntervalMultiplier : Float
    , useCorpseLocator : Bool
    , useCorpseLifeSpanMultiplier : Float
    , allowFlyerSpeedLeveling : Bool
    }


defaultGameIni : GameIni
defaultGameIni =
    { overrideItemMaxQuantities = Item.defaultItemMaxQuantities
    , allowUnlimitedRespecs = False
    , globalItemDecompositionTimeMultiplier = 1.0
    , pveDisableFriendlyFire = False
    , disableFriendlyFire = False
    , flyerPlatformAllowUnalignedDinoBasing = False
    , matingIntervalMultiplier = 1.0
    , matingSpeedMultiplier = 1.0
    , eggHatchSpeedMultiplier = 1.0
    , babyMatureSpeedMultiplier = 1.0
    , babyFoodConsumptionSpeedMultiplier = 1.0
    , babyImprintingStatScaleMultiplier = 1.0
    , babyImprintAmountMultiplier = 1.0
    , babyCuddleIntervalMultiplier = 1.0
    , babyCuddleGracePeriodMultiplier = 1.0
    , babyCuddleLoseImprintQualitySpeedMultiplier = 1.0
    , layEggIntervalMultiplier = 1.0
    , poopIntervalMultiplier = 1.0
    , cropGrowthSpeedMultiplier = 1.0
    , cropDecaySpeedMultiplier = 1.0
    , hairGrowthSpeedMultiplier = 1.0
    , structureDamageRepairCooldown = 180
    , customRecipeEffectivenessMultiplier = 1.0
    , customRecipeSkillMultiplier = 1.0
    , dinoHarvestingDamageMultiplier = 3.2
    , playerHarvestingDamageMultiplier = 1.0
    , supplyCrateLootQualityMultiplier = 1.0
    , fishingLootQualityMultiplier = 1.0
    , maxTribeLogs = 100
    , disableStructurePlacementCollision = False
    , autoUnlockAllEngrams = False
    , allowCustomRecipes = False
    , passiveTameIntervalMultiplier = 1.0
    , useCorpseLocator = False
    , useCorpseLifeSpanMultiplier = 1.0
    , allowFlyerSpeedLeveling = False
    }


setAllowUnlimitedRespecs : Bool -> GameIni -> GameIni
setAllowUnlimitedRespecs b gameIni =
    { gameIni
        | allowUnlimitedRespecs = b
    }


setOverrideItemMaxQuantities : List ItemMaxQuantity -> GameIni -> GameIni
setOverrideItemMaxQuantities itemMaxQuantities gameIni =
    { gameIni
        | overrideItemMaxQuantities = itemMaxQuantities
    }
