import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


myLast input = 
  case input of
    [] -> Nothing
    [t] -> Just t
    h::t -> myLast t

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

result = myLast ["1", "2", "3", "4"] |> (\c -> case c of 
  Nothing -> "Empty List"
  Just b -> b)
-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]