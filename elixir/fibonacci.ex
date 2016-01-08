defmodule Fibonacci do
  def map(list, f, acc \\ [])
  def map([], _f, acc), do: acc
  def map([head|tail], f, acc) do
    map(tail, f, acc ++ [f.(head)])
  end

  def fib(n) when is_integer(n) and n > 1 do
    map(Enum.to_list(1..n), &fibn(&1))
  end

  defp fibn(n, current \\ 0, next \\ 1)
  defp fibn(0, current, _next), do: current
  defp fibn(n, current, next), do: fibn(n - 1, next, current + next)
end
