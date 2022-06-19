module Util.String exposing
    ( createTimeString
    , fromBool
    )


fromBool : Bool -> String
fromBool b =
    if b then
        "true"

    else
        "false"


createTimeString : Float -> String
createTimeString time =
    let
        seconds =
            modBy 60 <| round time

        minutes =
            modBy 60 (round <| time / 60)

        hours =
            modBy 24 (round <| time / 60 / 60)

        days =
            round <| time / 60 / 60 / 24

        strDays =
            if days > 0 then
                String.fromInt days ++ "日"

            else
                ""

        strHours =
            if hours > 0 then
                String.fromInt hours ++ "時間"

            else
                ""

        strMinutes =
            if minutes > 0 then
                String.fromInt minutes ++ "分"

            else
                ""

        strSeconds =
            if seconds > 0 then
                String.fromInt seconds ++ "秒"

            else
                ""
    in
    [ strDays
    , strHours
    , strMinutes
    , strSeconds
    ]
        |> List.filter (\x -> x /= "")
        |> String.join " "
