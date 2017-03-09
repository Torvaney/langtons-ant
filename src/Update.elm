module Update exposing (update)

import Types exposing (..)

import Array
import Debug


-- Ant functions

antPosition : Model -> Int
antPosition model =
  (model.dim * model.ant.y) + model.ant.x


turnLeftDir : Ant -> Direction
turnLeftDir ant =
  case ant.direction of
    North -> West
    East -> North
    South -> East
    West -> South


turnRightDir : Ant -> Direction
turnRightDir ant =
  case ant.direction of
    West -> North
    North -> East
    East -> South
    South -> West


turn : Turn -> Ant -> Ant  -- I should add a Turn type and factorise thiss
turn turn ant =
  case turn of
    Left -> { ant | direction = (turnLeftDir ant) }
    Right -> { ant | direction = (turnRightDir ant) }


moveAntForward : Ant -> Ant
moveAntForward ant =
  case ant.direction of
    North -> { ant | y = ant.y + 1}
    East -> { ant | x = ant.x + 1}
    South -> { ant | y = ant.y - 1}
    West -> { ant | x = ant.x - 1}


-- Square function

getSquareColour : Model -> Maybe Square
getSquareColour model =
  Debug.log "squareColour" (Array.get (antPosition model) model.board)


setSquareColour : Square -> Board -> Int -> Board
setSquareColour newColour board position =
  Array.set position newColour board


-- Update

updateModel : Model -> Model
updateModel model =
  case (getSquareColour model) of
    Just Black ->
      { model
      | ant = model.ant |> turn Right |> moveAntForward
      , board = model |> antPosition |> setSquareColour White model.board
      }
    Just White ->
      { model
      | ant = model.ant |> turn Left |> moveAntForward
      , board = model |> antPosition |> setSquareColour Black model.board
      }
    Nothing -> model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  ( updateModel model, Cmd.none)
