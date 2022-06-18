module Ark.Consumable exposing (..)

import Ark.Type exposing (Item)


rawMeat : Item
rawMeat =
    { class = "PrimalItemConsumable_RawMeat_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_RawMeat.PrimalItemConsumable_RawMeat'"
    , name = "生肉"
    , maxQuantity = 40
    }


spoiledMeat : Item
spoiledMeat =
    { class = "PrimalItemConsumable_SpoiledMeat_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_SpoiledMeat.PrimalItemConsumable_SpoiledMeat'"
    , name = "腐った肉"
    , maxQuantity = 100
    }


cookedMeat : Item
cookedMeat =
    { class = "PrimalItemConsumable_CookedMeat_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CookedMeat.PrimalItemConsumable_CookedMeat'"
    , name = "こんがり肉"
    , maxQuantity = 50
    }


rawPrimeMeat : Item
rawPrimeMeat =
    { class = "PrimalItemConsumable_RawPrimeMeat_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_RawPrimeMeat.PrimalItemConsumable_RawPrimeMeat'"
    , name = "霜降り肉"
    , maxQuantity = 1
    }


cookedPrimeMeat : Item
cookedPrimeMeat =
    { class = "PrimalItemConsumable_CookedPrimeMeat_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CookedPrimeMeat.PrimalItemConsumable_CookedPrimeMeat'"
    , name = "霜降りこんがり肉"
    , maxQuantity = 30
    }


cookedMeatJerky : Item
cookedMeatJerky =
    { class = "PrimalItemConsumable_CookedMeat_Jerky_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CookedMeat_Jerky.PrimalItemConsumable_CookedMeat_Jerky'"
    , name = "干し肉"
    , maxQuantity = 50
    }


primeMeatJerky : Item
primeMeatJerky =
    { class = "PrimalItemConsumable_CookedPrimeMeat_Jerky_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CookedPrimeMeat_Jerky.PrimalItemConsumable_CookedPrimeMeat_Jerky'"
    , name = "霜降り干し肉"
    , maxQuantity = 30
    }


rawFishMeat : Item
rawFishMeat =
    { class = "PrimalItemConsumable_RawMeat_Fish_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_RawMeat_Fish.PrimalItemConsumable_RawMeat_Fish'"
    , name = "魚肉"
    , maxQuantity = 20
    }


cookedFishMeat : Item
cookedFishMeat =
    { class = "PrimalItemConsumable_CookedMeat_Fish_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CookedMeat_Fish.PrimalItemConsumable_CookedMeat_Fish'"
    , name = "こんがり魚"
    , maxQuantity = 30
    }


rawPrimeFishMeat : Item
rawPrimeFishMeat =
    { class = "PrimalItemConsumable_RawPrimeMeat_Fish_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_RawPrimeMeat_Fish.PrimalItemConsumable_RawPrimeMeat_Fish'"
    , name = "大トロ"
    , maxQuantity = 1
    }


cookedPrimeFishMeat : Item
cookedPrimeFishMeat =
    { class = "PrimalItemConsumable_CookedPrimeMeat_Fish_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CookedPrimeMeat_Fish.PrimalItemConsumable_CookedPrimeMeat_Fish'"
    , name = "こんがり大トロ"
    , maxQuantity = 30
    }


rawMutton : Item
rawMutton =
    { class = "PrimalItemConsumable_RawMutton_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_RawMutton.PrimalItemConsumable_RawMutton'"
    , name = "羊肉"
    , maxQuantity = 1
    }


cookedLambChop : Item
cookedLambChop =
    { class = "PrimalItemConsumable_CookedLambChop_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CookedLambChop.PrimalItemConsumable_CookedLambChop'"
    , name = "ラムチョップ"
    , maxQuantity = 30
    }


filledFishBasket : Item
filledFishBasket =
    { class = "PrimalItem_FishBasketFilled_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/PrimalItem_FishBasketFilled.PrimalItem_FishBasketFilled'"
    , name = "魚籠"
    , maxQuantity = 1
    }


wyvernMilk : Item
wyvernMilk =
    { class = "PrimalItemConsumable_WyvernMilk_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/BaseBPs/PrimalItemConsumable_WyvernMilk.PrimalItemConsumable_WyvernMilk'"
    , name = "ワイバーンミルク"
    , maxQuantity = 1
    }


amarberry : Item
amarberry =
    { class = "PrimalItemConsumable_Berry_Amarberry_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Berry_Amarberry.PrimalItemConsumable_Berry_Amarberry'"
    , name = "アマルベリー"
    , maxQuantity = 100
    }


azulberry : Item
azulberry =
    { class = "PrimalItemConsumable_Berry_Azulberry_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Berry_Azulberry.PrimalItemConsumable_Berry_Azulberry'"
    , name = "アズールベリー"
    , maxQuantity = 100
    }


mejoberry : Item
mejoberry =
    { class = "PrimalItemConsumable_Berry_Mejoberry_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Berry_Mejoberry.PrimalItemConsumable_Berry_Mejoberry'"
    , name = "メジョベリー"
    , maxQuantity = 100
    }


narcoberry : Item
narcoberry =
    { class = "PrimalItemConsumable_Berry_Narcoberry_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Berry_Narcoberry.PrimalItemConsumable_Berry_Narcoberry'"
    , name = "ナルコベリー"
    , maxQuantity = 100
    }


stimberry : Item
stimberry =
    { class = "PrimalItemConsumable_Berry_Stimberry_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Berry_Stimberry.PrimalItemConsumable_Berry_Stimberry'"
    , name = "スティムベリー"
    , maxQuantity = 100
    }


tintoberry : Item
tintoberry =
    { class = "PrimalItemConsumable_Berry_Tintoberry_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Berry_Tintoberry.PrimalItemConsumable_Berry_Tintoberry'"
    , name = "ティントベリー"
    , maxQuantity = 100
    }


cactusSap : Item
cactusSap =
    { class = "PrimalItemConsumable_CactusSap_C"
    , bpPath = "Blueprint'/Game/ScorchedEarth/CoreBlueprints/Consumables/PrimalItemConsumable_CactusSap.PrimalItemConsumable_CactusSap'"
    , name = "サボテンの樹液"
    , maxQuantity = 100
    }


citronal : Item
citronal =
    { class = "PrimalItemConsumable_Veggie_Citronal_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Veggie_Citronal.PrimalItemConsumable_Veggie_Citronal'"
    , name = "レモン"
    , maxQuantity = 100
    }


longrass : Item
longrass =
    { class = "PrimalItemConsumable_Veggie_Longrass_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Veggie_Longrass.PrimalItemConsumable_Veggie_Longrass'"
    , name = "トウモロコシ"
    , maxQuantity = 100
    }


rockarrot : Item
rockarrot =
    { class = "PrimalItemConsumable_Veggie_Rockarrot_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Veggie_Rockarrot.PrimalItemConsumable_Veggie_Rockarrot'"
    , name = "ニンジン"
    , maxQuantity = 100
    }


savoroot : Item
savoroot =
    { class = "PrimalItemConsumable_Veggie_Savoroot_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Veggie_Savoroot.PrimalItemConsumable_Veggie_Savoroot'"
    , name = "ジャガイモ"
    , maxQuantity = 100
    }


aggeravicMushroom : Item
aggeravicMushroom =
    { class = "PrimalItemResource_CommonMushroom_C"
    , bpPath = "Blueprint'/Game/Aberration/CoreBlueprints/Items/Consumables/PrimalItemResource_CommonMushroom.PrimalItemResource_CommonMushroom'"
    , name = "アガーラビック・マッシュルーム"
    , maxQuantity = 100
    }


aquaticMushroom : Item
aquaticMushroom =
    { class = "PrimalItemConsumable_Mushroom_Aquatic_C"
    , bpPath = "Blueprint'/Game/Aberration/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Mushroom_Aquatic.PrimalItemConsumable_Mushroom_Aquatic'"
    , name = "アクアティック・マッシュルーム"
    , maxQuantity = 100
    }


ascerbicMushroom : Item
ascerbicMushroom =
    { class = "PrimalItemConsumable_Mushroom_Ascerbic_C"
    , bpPath = "Blueprint'/Game/Aberration/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Mushroom_Ascerbic.PrimalItemConsumable_Mushroom_Ascerbic'"
    , name = "アサービック・マッシュルーム"
    , maxQuantity = 100
    }


auricMushroom : Item
auricMushroom =
    { class = "PrimalItemConsumable_Mushroom_Auric_C"
    , bpPath = "Blueprint'/Game/Aberration/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Mushroom_Auric.PrimalItemConsumable_Mushroom_Auric'"
    , name = "金のマッシュルーム"
    , maxQuantity = 100
    }


mushroomBrew : Item
mushroomBrew =
    { class = "PrimalItemConsumable_Soup_MushroomSoup_C"
    , bpPath = "Blueprint'/Game/Aberration/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_MushroomSoup.PrimalItemConsumable_Soup_MushroomSoup'"
    , name = "マッシュルームブリュー"
    , maxQuantity = 100
    }


waterskinEmpty : Item
waterskinEmpty =
    { class = "PrimalItemConsumable_WaterskinCraftable_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_WaterskinCraftable.PrimalItemConsumable_WaterskinCraftable'"
    , name = "皮袋(空)"
    , maxQuantity = 1
    }


waterskinFilled : Item
waterskinFilled =
    { class = "PrimalItemConsumable_WaterskinRefill_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_WaterskinRefill.PrimalItemConsumable_WaterskinRefill'"
    , name = "皮袋(フル)"
    , maxQuantity = 1
    }


waterJarEmpty : Item
waterJarEmpty =
    { class = "PrimalItemConsumable_WaterJarCraftable_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_WaterJarCraftable.PrimalItemConsumable_WaterJarCraftable'"
    , name = "水瓶(空)"
    , maxQuantity = 1
    }


waterJarFull : Item
waterJarFull =
    { class = "PrimalItemConsumable_WaterJarRefill_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_WaterJarRefill.PrimalItemConsumable_WaterJarRefill'"
    , name = "水瓶(フル)"
    , maxQuantity = 1
    }


icedWaterJarEmpty : Item
icedWaterJarEmpty =
    { class = "PrimalItemConsumable_IcedWaterJar_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_IcedWaterJar.PrimalItemConsumable_IcedWaterJar'"
    , name = "凍らせた水瓶(空)"
    , maxQuantity = 1
    }


icedWaterJarFull : Item
icedWaterJarFull =
    { class = "PrimalItemConsumable_IcedWaterJarRefill_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_IcedWaterJarRefill.PrimalItemConsumable_IcedWaterJarRefill'"
    , name = "凍らせた水瓶(フル)"
    , maxQuantity = 1
    }


canteenEmpty : Item
canteenEmpty =
    { class = "PrimalItemConsumable_CanteenCraftable_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CanteenCraftable.PrimalItemConsumable_CanteenCraftable'"
    , name = "水筒(空)"
    , maxQuantity = 1
    }


canteenFull : Item
canteenFull =
    { class = "PrimalItemConsumable_CanteenRefill_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CanteenRefill.PrimalItemConsumable_CanteenRefill'"
    , name = "水筒(フル)"
    , maxQuantity = 1
    }


icedCanteenEmpty : Item
icedCanteenEmpty =
    { class = "PrimalItemConsumable_IcedCanteen_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_IcedCanteen.PrimalItemConsumable_IcedCanteen'"
    , name = "凍らせた水筒(空)"
    , maxQuantity = 1
    }


icedCanteenFull : Item
icedCanteenFull =
    { class = "PrimalItemConsumable_IcedCanteenRefill_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_IcedCanteenRefill.PrimalItemConsumable_IcedCanteenRefill'"
    , name = "凍らせた水筒(フル)"
    , maxQuantity = 1
    }


beerLiquid : Item
beerLiquid =
    { class = "PrimalItemResource_Beer_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Resources/PrimalItemResource_Beer.PrimalItemResource_Beer'"
    , name = "ビール液"
    , maxQuantity = 100
    }


beerJar : Item
beerJar =
    { class = "PrimalItemConsumable_BeerJar_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_BeerJar.PrimalItemConsumable_BeerJar'"
    , name = "ビール瓶"
    , maxQuantity = 20
    }


beerJaralt : Item
beerJaralt =
    { class = ""
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_BeerJarAlt.PrimalItemConsumable_BeerJarAlt'"
    , name = "ビール瓶(alt)"
    , maxQuantity = 1
    }


bioToxin : Item
bioToxin =
    { class = "PrimalItemConsumable_JellyVenom_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_JellyVenom.PrimalItemConsumable_JellyVenom'"
    , name = "バイオトキシン"
    , maxQuantity = 100
    }


medicalBrew : Item
medicalBrew =
    { class = "PrimalItemConsumable_HealSoup_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_HealSoup.PrimalItemConsumable_HealSoup'"
    , name = "メディカルブリュー"
    , maxQuantity = 100
    }


energyBrew : Item
energyBrew =
    { class = "PrimalItemConsumable_StaminaSoup_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_StaminaSoup.PrimalItemConsumable_StaminaSoup'"
    , name = "エナジーブリュー"
    , maxQuantity = 100
    }


battleTartare : Item
battleTartare =
    { class = "PrimalItemConsumable_Soup_BattleTartare_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_BattleTartare.PrimalItemConsumable_Soup_BattleTartare'"
    , name = "バトルタルタルステーキ"
    , maxQuantity = 100
    }


brothofEnlightenment : Item
brothofEnlightenment =
    { class = "PrimalItemConsumable_TheHorn_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_TheHorn.PrimalItemConsumable_TheHorn'"
    , name = "啓発の煮汁"
    , maxQuantity = 100
    }


bugRepellant : Item
bugRepellant =
    { class = "PrimalItemConsumable_BugRepellant_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_BugRepellant.PrimalItemConsumable_BugRepellant'"
    , name = "防虫剤"
    , maxQuantity = 100
    }


cactusBroth : Item
cactusBroth =
    { class = "PrimalItemConsumable_CactusBuffSoup_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_CactusBuffSoup.PrimalItemConsumable_CactusBuffSoup'"
    , name = "サボテンスープ"
    , maxQuantity = 100
    }


calienSoup : Item
calienSoup =
    { class = "PrimalItemConsumable_Soup_CalienSoup_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_CalienSoup.PrimalItemConsumable_Soup_CalienSoup'"
    , name = "カリエンスープ"
    , maxQuantity = 100
    }


enduroStew : Item
enduroStew =
    { class = "PrimalItemConsumable_Soup_EnduroStew_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_EnduroStew.PrimalItemConsumable_Soup_EnduroStew'"
    , name = "エンデュロシチュー"
    , maxQuantity = 100
    }


focalChili : Item
focalChili =
    { class = "PrimalItemConsumable_Soup_FocalChili_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_FocalChili.PrimalItemConsumable_Soup_FocalChili'"
    , name = "フォーカルチリ"
    , maxQuantity = 100
    }


friaCurry : Item
friaCurry =
    { class = "PrimalItemConsumable_Soup_FriaCurry_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_FriaCurry.PrimalItemConsumable_Soup_FriaCurry'"
    , name = "フリアカレー"
    , maxQuantity = 100
    }


lazarusChowder : Item
lazarusChowder =
    { class = "PrimalItemConsumable_Soup_LazarusChowder_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_LazarusChowder.PrimalItemConsumable_Soup_LazarusChowder'"
    , name = "ラザルスチャウダー"
    , maxQuantity = 100
    }


lesserAntidote : Item
lesserAntidote =
    { class = "PrimalItemConsumable_CureLow_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/BaseBPs/PrimalItemConsumable_CureLow.PrimalItemConsumable_CureLow'"
    , name = "解毒剤(弱)"
    , maxQuantity = 100
    }


mindwipeTonic : Item
mindwipeTonic =
    { class = "PrimalItemConsumableRespecSoup_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/BaseBPs/PrimalItemConsumableRespecSoup.PrimalItemConsumableRespecSoup'"
    , name = "マインドワイプトニック"
    , maxQuantity = 100
    }


shadowSteakSaute : Item
shadowSteakSaute =
    { class = "PrimalItemConsumable_Soup_ShadowSteak_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Soup_ShadowSteak.PrimalItemConsumable_Soup_ShadowSteak'"
    , name = "シャドウステーキ"
    , maxQuantity = 100
    }


soap : Item
soap =
    { class = "PrimalItemConsumableSoap_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/BaseBPs/PrimalItemConsumableSoap.PrimalItemConsumableSoap'"
    , name = "石鹸"
    , maxQuantity = 100
    }


sweetVegetableCake : Item
sweetVegetableCake =
    { class = "PrimalItemConsumable_SweetVeggieCake_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_SweetVeggieCake.PrimalItemConsumable_SweetVeggieCake'"
    , name = "スイートベジタブルケーキ"
    , maxQuantity = 10
    }


giantBeeHoney : Item
giantBeeHoney =
    { class = "PrimalItemConsumable_Honey_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Honey.PrimalItemConsumable_Honey'"
    , name = "巨大ハチのハチミツ"
    , maxQuantity = 1
    }


basicKibble : Item
basicKibble =
    { class = "PrimalItemConsumable_Kibble_Base_XSmall_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_XSmall.PrimalItemConsumable_Kibble_Base_XSmall'"
    , name = "キブル(基本)"
    , maxQuantity = 100
    }


simpleKibble : Item
simpleKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Small_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Small.PrimalItemConsumable_Kibble_Base_Small'"
    , name = "キブル(簡易)"
    , maxQuantity = 100
    }


regularKibble : Item
regularKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Medium_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Medium.PrimalItemConsumable_Kibble_Base_Medium'"
    , name = "キブル(通常)"
    , maxQuantity = 100
    }


superiorKibble : Item
superiorKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Large_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Large.PrimalItemConsumable_Kibble_Base_Large'"
    , name = "キブル(優)"
    , maxQuantity = 100
    }


exceptionalKibble : Item
exceptionalKibble =
    { class = "PrimalItemConsumable_Kibble_Base_XLarge_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_XLarge.PrimalItemConsumable_Kibble_Base_XLarge'"
    , name = "キブル(超級)"
    , maxQuantity = 100
    }


extraordinaryKibble : Item
extraordinaryKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Special_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Special.PrimalItemConsumable_Kibble_Base_Special'"
    , name = "キブル(特級)"
    , maxQuantity = 100
    }


basicAugmentedKibble : Item
basicAugmentedKibble =
    { class = "PrimalItemConsumable_Kibble_Base_XSmall_EX_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_XSmall_EX.PrimalItemConsumable_Kibble_Base_XSmall_EX'"
    , name = "増強キブル(基本)"
    , maxQuantity = 100
    }


simpleAugmentedKibble : Item
simpleAugmentedKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Small_EX_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Small_EX.PrimalItemConsumable_Kibble_Base_Small_EX'"
    , name = "増強キブル(簡易)"
    , maxQuantity = 100
    }


regularAugmentedKibble : Item
regularAugmentedKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Medium_EX_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Medium_EX.PrimalItemConsumable_Kibble_Base_Medium_EX'"
    , name = "増強キブル(通常)"
    , maxQuantity = 100
    }


superiorAugmentedKibble : Item
superiorAugmentedKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Large_EX_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Large_EX.PrimalItemConsumable_Kibble_Base_Large_EX'"
    , name = "増強キブル(優)"
    , maxQuantity = 100
    }


exceptionalAugmentedKibble : Item
exceptionalAugmentedKibble =
    { class = "PrimalItemConsumable_Kibble_Base_XLarge_EX_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_XLarge_EX.PrimalItemConsumable_Kibble_Base_XLarge_EX'"
    , name = "増強キブル(超級)"
    , maxQuantity = 100
    }


extraordinaryAugmentedKibble : Item
extraordinaryAugmentedKibble =
    { class = "PrimalItemConsumable_Kibble_Base_Special_EX_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/Consumables/PrimalItemConsumable_Kibble_Base_Special_EX.PrimalItemConsumable_Kibble_Base_Special_EX'"
    , name = "増強キブル(特級)"
    , maxQuantity = 100
    }


evilEmote : Item
evilEmote =
    { class = "PrimalItemConsumable_UnlockEmote_Evil_C"
    , bpPath = "Blueprint'/Game/PrimalEarth/CoreBlueprints/Items/Consumables/BaseBPs/PrimalItemConsumable_UnlockEmote_Evil.PrimalItemConsumable_UnlockEmote_Evil'"
    , name = "イービルエモート"
    , maxQuantity = 100
    }


gachaCrystal : Item
gachaCrystal =
    { class = "PrimalItemConsumable_GachaPod_C"
    , bpPath = "Blueprint'/Game/Extinction/Dinos/Gacha/PrimalItemConsumable_GachaPod.PrimalItemConsumable_GachaPod'"
    , name = "ガチャ・クリスタル"
    , maxQuantity = 1
    }


unassembledEnforcer : Item
unassembledEnforcer =
    { class = "PrimalItem_Spawner_Enforcer_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/PrimalItem_Spawner_Enforcer.PrimalItem_Spawner_Enforcer'"
    , name = "未完成エンフォーサー"
    , maxQuantity = 1
    }


unassembledMek : Item
unassembledMek =
    { class = "PrimalItem_Spawner_Mek_C"
    , bpPath = "Blueprint'/Game/Extinction/CoreBlueprints/Items/PrimalItem_Spawner_Mek.PrimalItem_Spawner_Mek'"
    , name = "未完成MEK"
    , maxQuantity = 1
    }


namelessVenom : Item
namelessVenom =
    { class = "PrimalItemConsumable_NamelessVenom_C"
    , bpPath = "Blueprint'/Game/Aberration/CoreBlueprints/Resources/PrimalItemConsumable_NamelessVenom.PrimalItemConsumable_NamelessVenom'"
    , name = "ネームレスの毒"
    , maxQuantity = 1
    }


reaperPheromoneGland : Item
reaperPheromoneGland =
    { class = "PrimalItemResource_XenomorphPheromoneGland_C"
    , bpPath = "Blueprint'/Game/Aberration/CoreBlueprints/Resources/PrimalItemResource_XenomorphPheromoneGland.PrimalItemResource_XenomorphPheromoneGland'"
    , name = "リーパーのフェロモン腺"
    , maxQuantity = 100
    }


items : List Item
items =
    [ rawMeat
    , spoiledMeat
    , cookedMeat
    , rawPrimeMeat
    , cookedPrimeMeat
    , cookedMeatJerky
    , primeMeatJerky
    , rawFishMeat
    , cookedFishMeat
    , rawPrimeFishMeat
    , cookedPrimeFishMeat
    , rawMutton
    , cookedLambChop
    , filledFishBasket
    , wyvernMilk
    , amarberry
    , azulberry
    , mejoberry
    , narcoberry
    , stimberry
    , tintoberry
    , cactusSap
    , citronal
    , longrass
    , rockarrot
    , savoroot
    , aggeravicMushroom
    , aquaticMushroom
    , ascerbicMushroom
    , auricMushroom
    , mushroomBrew
    , waterskinEmpty
    , waterskinFilled
    , waterJarEmpty
    , waterJarFull
    , icedWaterJarEmpty
    , icedWaterJarFull
    , canteenEmpty
    , canteenFull
    , icedCanteenEmpty
    , icedCanteenFull
    , beerLiquid
    , beerJar
    , bioToxin
    , medicalBrew
    , energyBrew
    , battleTartare
    , brothofEnlightenment
    , bugRepellant
    , cactusBroth
    , calienSoup
    , enduroStew
    , focalChili
    , friaCurry
    , lazarusChowder
    , lesserAntidote
    , mindwipeTonic
    , shadowSteakSaute
    , soap
    , sweetVegetableCake
    , giantBeeHoney
    , basicKibble
    , simpleKibble
    , regularKibble
    , superiorKibble
    , exceptionalKibble
    , extraordinaryKibble
    , basicAugmentedKibble
    , simpleAugmentedKibble
    , regularAugmentedKibble
    , superiorAugmentedKibble
    , exceptionalAugmentedKibble
    , extraordinaryAugmentedKibble
    , evilEmote
    , gachaCrystal
    , unassembledEnforcer
    , unassembledMek
    , namelessVenom
    , reaperPheromoneGland
    ]
