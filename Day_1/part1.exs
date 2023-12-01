{:ok, input} = File.read("./data.txt")

number_pairs = String.split(Regex.replace(~r/[a-zA-Z]/, input, ""))

number_pair_list = for x <- number_pairs, do: List.to_tuple(Integer.digits(String.to_integer(x)))

numbers =
  for x <- number_pair_list, do: Integer.undigits([elem(x, 0), elem(x, tuple_size(x) - 1)])

IO.puts(Enum.sum(numbers))
