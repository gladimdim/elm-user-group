import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


elementAt input index = 
  if index < 0 then Nothing
  else 
    case input of
      [] -> Nothing
      [t] ->
        if index == 0 then
          Just t
        else 
          Nothing
      t::b -> 
        if index == 0 then
          Just t
        else elementAt b (index - 1)
      

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

result = elementAt ["1", "2", "3", "4"] 2 |> (\c -> case c of 
  Nothing -> "Not found"
  Just b -> b)
-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]