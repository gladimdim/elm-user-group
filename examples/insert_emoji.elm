import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model = Int

init : Model
init =
  0


-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1

emoji = '👏'

insertIntoList input = 
  case input of
    [] -> []
    [a] -> []
    a::b::c ->
      if b == ' ' then
        a :: b :: emoji :: b :: (insertIntoList c)
      else
        a :: (insertIntoList (b::c))

insert_emoji input =
  input 
  |> String.toList
  |> insertIntoList
  |> String.fromList

result = insert_emoji "Hello, world you are awesome! Aren't you?"

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]