# Langton's Ant

An implementation of Langton's ant in elm.

The algorithm is described below:

> Squares on a plane are colored variously either black or white. We arbitrarily identify one square as the "ant". The ant can travel in any of the four cardinal directions at each step it takes. The "ant" moves according to the rules below:
>
> * At a white square, turn 90° right, flip the color of the square, move forward one unit
> * At a black square, turn 90° left, flip the color of the square, move forward one unit

(From [Wikipedia](https://en.wikipedia.org/wiki/Langton's_ant))

Created as part of the [Elm London Hack Night (08/03/2017)](https://www.meetup.com/Elm-London-Meetup/events/238138374/)
