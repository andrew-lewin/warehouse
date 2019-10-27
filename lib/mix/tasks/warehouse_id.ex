defmodule Mix.Tasks.WarehouseId do
  use Mix.Task

  def run(_) do
    Warehouse.read() |> solve()
  end

  defp solve([]), do: :noop
  defp solve([x]), do:
    IO.puts("Odd number of inputs given. Extra input: #{x}")
  defp solve([x, y | tail]) do
    answer = Warehouse.answer(x, y)
    IO.puts("[#{x}, #{y}] = #{answer}")
    solve(tail)
  end
end
