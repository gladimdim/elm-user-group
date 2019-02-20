import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

last : List a -> Maybe a
last input = 
  case input of
    [] -> Nothing
    [t] -> Just t
    _::h -> last h

first : List a -> Maybe a
first input =
  case input of
    [] -> Nothing
    [t] -> Just t
    h::_ -> Just h


reverse : List a -> List a
reverse input = 
  case input of
    [] -> []
    [t] -> [t]
    t::h -> List.append (reverse h ) [t]

inner input1 input2 =
  let _ = Debug.log "yo" in
  case (input1, input2) of
    ([], []) -> True
    ([h1], [h2]) ->
      Debug.log "lol"
      True
      -- if h1 == h2 then
      --   True
      -- else
      --   False
    ([a1, a2], [b1, b2]) -> 
      if a1 == b1 && a2 == b2 then
        True
      else
        False
    (h1::t1, h2::t2) ->
      if h1 == h2 then
        inner t1 t2
      else 
        False
    (_, _) -> False

isPalyndrom : List a -> Bool
isPalyndrom input =
  let _ = Debug.log "kuku" input in
    inner input (reverse input)

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

result =
  case isPalyndrom [2, 1, 2, 4, 3, 2, 1, 2] of
    True -> "True"
    False -> "False"

view : Model -> Html Msg
view model =
  div []
    [ result |> text
    ]