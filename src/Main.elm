import Types exposing (..)
import Update exposing (update)
import View exposing (view)

import Html exposing (Html, program, div, h1, p, text)
import Time exposing (Time, second)
import Array


-- Subscriptions

subs : Model -> Sub Msg
subs model =
  Time.every second Tick


-- Initialise the model

dim_init = 20  -- 20 x 20 board
board_init = Array.repeat (dim_init * dim_init) White
ant_init = {direction = North, x = 10, y = 10}

model_init =
  { ant = ant_init
  , board = board_init
  , dim = dim_init
  }


-- Main


main : Program Never Model Msg
main =
    program
        { init = (model_init, Cmd.none)
        , view = view
        , update = update
        , subscriptions = subs
        }
