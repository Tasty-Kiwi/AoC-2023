# This code is... bad
# I was so desperate to finish this

{:ok, input} = File.read("./data.txt")

word_to_int = fn a ->
  case a do
    "one" -> "1"
    "two" -> "2"
    "three" -> "3"
    "four" -> "4"
    "five" -> "5"
    "six" -> "6"
    "seven" -> "7"
    "eight" -> "8"
    "nine" -> "9"
    "ne" -> "1"
    "wo" -> "2"
    "hree" -> "3"
    "our" -> "4"
    "ive" -> "5"
    "ix" -> "6"
    "even" -> "7"
    "ight" -> "8"
    "ine" -> "9"
  end
end

number_pairs =
  String.split(
    Regex.replace(
      ~r/[a-zA-Z]/,
      Regex.replace(
        # Perform a `?` quantifier as strings can be like "oneight"
        ~r/o?ne|t?wo|t?hree|f?our|f?ive|s?ix|s?even|e?ight|n?ine/,
        Regex.replace(
          ~r/(one)|(two)|(three)|(four)|(five)|(six)|(seven)|(eight)|(nine)/,
          input,
          word_to_int
        ),
        word_to_int
      ),
      ""
    )
  )

number_pair_list = for x <- number_pairs, do: List.to_tuple(Integer.digits(String.to_integer(x)))

numbers =
  for x <- number_pair_list, do: Integer.undigits([elem(x, 0), elem(x, tuple_size(x) - 1)])

IO.puts(Enum.sum(numbers))
