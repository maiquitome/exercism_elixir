defmodule LanguageList do
  def new, do: []

  def add(list, language), do: [language | list]
  def remove([_ | tail]), do: tail
  def first([head | _]), do: head
  def count(list), do: length(list)
  def functional_list?(list), do: "Elixir" in list

  # def add(list, language), do: List.insert_at(list, 0, language)
  # def remove(list), do: List.delete_at(list, 0)
  # def first(list), do: List.first(list)
  # def count(list), do: Enum.count(list)
  # def functional_list?(list), do: Enum.find_value(list, & &1 == "Elixir")
end
