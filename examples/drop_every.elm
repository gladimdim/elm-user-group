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


dropEvery : List a -> Int -> List a
dropEvery list i = 
  let
    inner input t =
      case input of
        [] -> []
        [a] ->
          if t == 0 then
            []
          else
            [a]
        a::b ->
          if t == 0 then
            inner b (i-1)
          else
            a :: (inner b (t-1))
  in
    inner list (i-1)

result = dropEvery ["1", "2", "3", "4"] 3 |> String.join " "

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]