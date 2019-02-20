import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

reverse : List a -> List a
reverse input = 
  case input of
    [] -> []
    [t] -> [t]
    t::h -> List.append (reverse h ) [t]

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

result = reverse ["0", "1", "2", "3", "4", "5", "6", "7"] |> String.join " "

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]