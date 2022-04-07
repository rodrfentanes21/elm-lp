module Main exposing (..)
-- Aperte um botão aleatório para tirar uma carta
-- para rodar esse codigo é necessário instalar a seguinte dependência via cmd.
--   elm install elm/random

import Browser
-- a sintaxe de import dessa linguagem permite a importação de estruturas separadar como div, form etc. ou a
-- importação de todas estruturas por meio do indicador '..' como utilizado na linha abaixo
import Html exposing (..) 
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import Random



-- Inicio da função main


main : Program () Model Msg
main =
  Browser.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }



type alias Model =
  { card : Card
  }


init : () -> (Model, Cmd Msg)
init _ =
  ( Model Three
  , Cmd.none
  )

-- por meio dessa estrutura e suas referências é criado o tipo Card, que varia entre as cartas de um baralho convencional.
-- é possivel pelo vscode com as devidas extensões da linguagem visualizar quais estruturas de codigo a função referencia
type Card
  = Ace
  | Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten
  | Jack
  | Queen
  | King



-- função de update
type Msg
  = Draw
  | NewCard Card


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Draw ->
      ( model
      , Random.generate NewCard cardGenerator
      )

    NewCard newCard ->
      ( Model newCard
      , Cmd.none
      )

-- função responsável por eleger aleatóriamente uma carta para mostrar na tela
cardGenerator : Random.Generator Card
cardGenerator =
  Random.uniform Ace
    [ Two
    , Three
    , Four
    , Five
    , Six
    , Seven
    , Eight
    , Nine
    , Ten
    , Jack
    , Queen
    , King
    ]



subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- estrutura do botão "draw", que quando apertado, trocará a carta sendo mostrada de forma aleatória
view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Draw ] [ text "Draw" ]
    , div [ style "font-size" "12em" ] [ text (viewCard model.card) ]
    ]


-- switch case responsável por definir a aparência de cada carta na tela
viewCard : Card -> String
viewCard card =
  case card of
    Ace -> "🂡"
    Two -> "🂢"
    Three -> "🂣"
    Four -> "🂤"
    Five -> "🂥"
    Six -> "🂦"
    Seven -> "🂧"
    Eight -> "🂨"
    Nine -> "🂩"
    Ten -> "🂪"
    Jack -> "🂫"
    Queen -> "🂭"
    King -> "🂮"


