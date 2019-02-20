import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


myLastButOne input = 
  case input of
    [] -> Nothing
    [t] -> Nothing
    [t1, t2] -> Just t1
    h::t -> myLastButOne t

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

result = myLastButOne ["1", "2", "3"] |> (\c -> case c of 
  Nothing -> "N/A"
  Just b -> b)
-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]