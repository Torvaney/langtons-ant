module View exposing (..)

import Types exposing (..)
import Html exposing (Html, div, p, text)

import Array
import Html exposing (Html, div)
import Markdown
import Svg exposing (..)
import Svg.Attributes exposing (..)


-- View


explanatoryText = """
Squares on a plane are colored variously either black or white. We arbitrarily identify one square as the "ant". The ant can travel in any of the four cardinal directions at each step it takes. The "ant" moves according to the rules below:

* At a white square, turn 90° right, flip the color of the square, move forward one unit
* At a black square, turn 90° left, flip the color of the square, move forward one unit

From [Wikipedia](https://en.wikipedia.org/wiki/Langton's_ant)
"""


view : Model -> Html Msg
view model =
  div []
    [ Html.h1 [] [ Html.text "Langton's ant" ]
    , Markdown.toHtml [] explanatoryText
    , viewSvg model
    ]


-- Svg

squareSize : Int
squareSize =
  15


viewSvg : Model -> Html Msg
viewSvg model =
    svg
        [ width (svgWidth model squareSize)
        , height (svgWidth model squareSize)
        ]
        [ boardSvg model
        , antSvg model
        ]


svgWidth : Model -> Int -> String
svgWidth model squareSize =
  toString (model.dim * squareSize)


boardSvg : Model -> Svg msg
boardSvg model =
    g []
      (List.indexedMap (squareView model.dim) (Array.toList model.board))


toColorCode : Square -> String
toColorCode squareColour =
    case squareColour of
        Black ->
            "black"
        White ->
            "white"


getX : Int -> Int -> Int
getX dim boardPosition =
  rem boardPosition dim


getY : Int -> Int -> Int
getY dim boardPosition =
  (//) boardPosition dim


squareView : Int -> Int -> Square -> Svg msg
squareView dim boardPosition square =
    rect
        [ x <| toString <| (*) squareSize <| getX dim <| boardPosition
        , y <| toString <| (*) squareSize <| getY dim <| boardPosition
        , width <| toString squareSize
        , height <| toString squareSize
        , fill (toColorCode square)
        , stroke "lightgray"
        ]
        []


scaleXY : Int -> Float
scaleXY num =
  toFloat (num * squareSize) + (toFloat squareSize / 2)


antSvg : Model -> Svg msg
antSvg model =
    let
        radius =
            toFloat squareSize / 3
    in
        circle
            [ cx <| toString <| scaleXY <| model.ant.x
            , cy <| toString <| scaleXY <| model.ant.y
            , r <| toString radius
            , fill "lightblue"
            ]
            []
