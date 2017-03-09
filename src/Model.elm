module Model exposing (model_init)

import Types exposing (..)

import Array

dim_init = 20  -- 20 x 20 square
board_init = Array.repeat (dim_init * dim_init) White
ant_init = {direction = North, x = 1, y = 1}

model_init =
  { ant = ant_init
  , board = board_init
  , dim = dim_init
  }
