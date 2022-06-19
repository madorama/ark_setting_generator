module Madlib.Update exposing (..)


andThen : (model -> ( model, Cmd msg )) -> ( model, Cmd msg ) -> ( model, Cmd msg )
andThen f ( model, cmd ) =
    let
        ( newModel, newCmd ) =
            f model
    in
    ( newModel, Cmd.batch [ cmd, newCmd ] )


addCmd : Cmd msg -> ( model, Cmd msg ) -> ( model, Cmd msg )
addCmd newCmd ( model, cmd ) =
    ( model, Cmd.batch [ cmd, newCmd ] )


updateModel : (model -> model) -> ( model, Cmd msg ) -> ( model, Cmd msg )
updateModel f ( model, cmd ) =
    ( f model, cmd )
