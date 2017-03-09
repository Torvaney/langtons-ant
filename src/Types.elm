module Types exposing (..)

import Array
import Time exposing (Time)


type Msg
  = Tick Time


type Turn =
  Left | Right


type Direction =
  North | East | South | West


type alias Ant =
  { direction : Direction,
    x : Int,
    y : Int
  }


type Square = Black | White

type alias Board = Array.Array Square


type alias Model =
  { ant : Ant
  , board : Board
  , dim : Int
  }
