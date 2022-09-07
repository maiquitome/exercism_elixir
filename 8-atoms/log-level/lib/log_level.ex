defmodule LogLevel do
  # def to_label(level, legacy?)
  # def to_label(0, false), do: :trace
  # def to_label(1, _legacy?), do: :debug
  # def to_label(2, _legacy?), do: :info
  # def to_label(3, _legacy?), do: :warning
  # def to_label(4, _legacy?), do: :error
  # def to_label(5, false), do: :fatal
  # def to_label(_level, _legacy?), do: :unknown

  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 and not legacy? -> :fatal
      true -> :unknown
    end

    # case {level, legacy?} do
    #   {0, false} -> :trace
    #   {1, _} -> :debug
    #   {2, _} -> :info
    #   {3, _} -> :warning
    #   {4, _} -> :error
    #   {5, false} -> :fatal
    #   _ -> :unknown
    # end
  end

  def alert_recipient(level, legacy?) do
    # label = to_label(level, legacy?)
    # cond do
    #   label == :error or label == :fatal -> :ops
    #   label == :unknown and legacy? -> :dev1
    #   label == :unknown -> :dev2
    #   true -> false
    # end

    level
    |> to_label(legacy?)
    |> check_label(legacy?)
  end

  defp check_label(label, _legacy?) when label in [:debug, :info, :warning, :trace], do: false
  defp check_label(label, _legacy?) when label in [:error, :fatal], do: :ops
  defp check_label(label, true) when label not in [:trace, :fatal], do: :dev1
  defp check_label(:unknown, _legacy?), do: :dev2

  # def alert_recipient(level, legacy?) do
  #   label = to_label(level, legacy?)
  #   case {label, legacy?} do
  #     {:error, _} -> :ops
  #     {:fatal, _} -> :ops
  #     {:unknown, true} -> :dev1
  #     {:unknown, false} -> :dev2
  #     {_, _} -> false
  #   end
  # end
end
