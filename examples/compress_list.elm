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

listCompress : List a -> List a
listCompress list = 
  case list of 
    [] -> []
    [a] -> [a]
    [a, b] ->
      if a == b then
        [b]
      else 
        [a, b]
    h::n::t ->
      if h == n then
        listCompress (n::t)
      else
        h :: listCompress (n::t)

compress input = 
  input
  |> String.toList
  |> listCompress
  |> String.fromList



result = compress "aabbccccccddefffffafaa"

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]