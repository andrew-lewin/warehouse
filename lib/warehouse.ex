defmodule Warehouse do
  @moduledoc """
  Documentation for Warehouse.
  """

  @read_message "Enter a coordinate: "

  @doc """
  Reads integers from STDIN until a 0 is entered.
  """
  def read do
    @read_message
    |> IO.gets()
    |> String.trim()
    |> case do
      "0" -> []
      number -> [String.to_integer(number) | read()]
    end
  end

  @doc """
  Returns the ID of the item at coordinates x,y in the warehouse.
  x will follow a perfect triangular series, and y will act like
  a triangular series, but starting from a different base and
  offset.

  ## Examples

      iex> Warehouse.answer(2,3)
      "8"
      iex> Warehouse.answer(3,2)
      "9"
  """
  def answer(x, y) do
    x
    |> triangular_number()
    |> Kernel.+(upward_sum(x, y))
    |> Integer.to_string()
  end

  @doc """
  The ground level of our warehouse represents triangular numbers,
  so this function calculates the ID of the box touching the ground
  exactly below from the one we're computing the ID of.

  Ex:

  | 7
  | 4  8
  | 2  5  9
  | 1  3  6 10

  The first four triangular numbers are 1, 3, 6, 10. You can see them
  at the base of this stack.

  ## Examples

      iex> Warehouse.triangular_number(3)
      6
  """
  def triangular_number(x, count \\ 2)

  def triangular_number(1, _count), do: 1

  def triangular_number(x, count) do
    count + triangular_number(x-1, count + 1)
  end

  @doc """
  Fast version of triangular_number/2. See documentation
  for triangular_number/2.

  ## Examples

      iex> Warehouse.fast_triangular_number(3)
      6
  """
  def fast_triangular_number(x) do
    div(x * (x + 1), 2)
  end

  @doc """
  This returns the difference between the triangular number and
  what our target ID is based on how far it is off the ground.

  Ex:

  | 7
  | 4  8
  | 2  5  9
  | 1  3  6 10

  If we're targeting [2, 3], our triangular number will be 3 and we're
  looking to get an answer of 8. upward_sum/2 is going to return 5, allowing
  us to later add that to 3 and get 8.

  If we're targeting [1, 4], our triangular number will be 1 and we're
  looking to get an answer of 7. upward_sum/2 is going to return 6, allowing
  us to later add that to 1 and get 7.

  This works by starting at the offset for x, then recursively adding x + 1
  to it y times.

  ## Examples

    iex> Warehouse.upward_sum(2, 3)
    5
    iex> Warehouse.upward_sum(1, 4)
    6
  """
  def upward_sum(_x, 1), do: 0
  def upward_sum(x, y) do
    x + upward_sum(x+1, y-1)
  end

  @doc """
  Takes two numbers, y and id, and figures out what the corresponding
  x-coordinate must be.

  ## Examples

    iex> Warehouse.stretch_goal(100000, 6436088697)
    13457
  """
  def stretch_goal(y, id, lo \\ 1, hi \\ 100_000) do
    x = Integer.floor_div((hi + lo), 2)
    result = fast_triangular_number(x) + upward_sum(x, y)
    cond do
      hi < lo -> IO.puts("There is no x such that when y is #{y} the ID is #{id}")
      result > id -> stretch_goal(y, id, lo, x - 1)
      result < id -> stretch_goal(y, id, x + 1, hi)
      true -> x
    end
  end
end
