port module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text, span, h1)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

port calculateFibonacci: Int -> Cmd msg
port receiveFibonacci: (Int -> msg) -> Sub msg

type alias Model =
  { count : Int
  , fibonacci : Int
  }


initialModel : () -> (Model, Cmd Msg)
initialModel _ =
  ({ count = 0
  , fibonacci = 1
  }
  , Cmd.none
  )


type Msg
  = Increment
  | Decrement
  | ReceiveFibonacci Int


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      ({ model | count = model.count + 1 }
      , calculateFibonacci <| model.count + 1
      )

    Decrement ->
      ({ model | count = model.count - 1 }
      , calculateFibonacci <| model.count - 1
      )

    ReceiveFibonacci newFibonacci ->
      ({ model | fibonacci = newFibonacci}
      , Cmd.none
      )
  


view : Model -> Html Msg
view model =
  let
    buttonStyles =
      [ style "padding" "4px 12px"
      , style "background" "#e8e7e2"
      , style "border-radius" "28px"
      , style "font-size" "0.8em"
      , style "border" "2px solid grey"
      , style "margin-right" "10px"
      ]
  in
  div
    [ style "width" "100%"
    , style "height" "100%"
    , style "font-family" "Helvetica, sans-serif"
    , style "line-height" "3.5em"
    , style "width" "50vw"
    , style "min-width" "350px"
    , style "margin" "auto"
    ]
    [ h1
      [ style "color" "grey" ]
      [ span []
        [ text "Congrats! You can now use " ]
      , div [ style "color" "#60b5cc" ]
        [ text <| "Elm: " ++ "n = " ++ String.fromInt model.count ]
      , span [] [ text " and " ]
      , button
        (onClick Increment :: buttonStyles)
        [ text "+1" ]
      , button
        (onClick Decrement :: buttonStyles)
        [ text "-1" ]
      , div [ style "color" "#f74c00" ]
        [ text <| "Rust: " ++ "fibonacci(n) = " ++ String.fromInt model.fibonacci ]
      , span []
        [ text " together!" ]
      ]
    ]


subscriptions _ =
  receiveFibonacci ReceiveFibonacci


main : Program () Model Msg
main =
  Browser.element
    { init = initialModel
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
