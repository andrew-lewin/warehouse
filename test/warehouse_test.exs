defmodule WarehouseTest do
  use ExUnit.Case
  doctest Warehouse

  describe "answer/2" do
    test "returns the correct number" do
      assert Warehouse.answer(2, 2) == "5"
      assert Warehouse.answer(2, 4) == "12"
      assert Warehouse.answer(4, 1) == "10"
      assert Warehouse.answer(4, 2) == "14"
      assert Warehouse.answer(612, 231) == "354673"
      assert Warehouse.answer(11_111, 11_111) == "246886421"
      assert Warehouse.answer(100_000, 100_000) == "19999800001"
    end
  end

  describe "triangular_number/2" do
    test "returns the correct number" do
      assert Warehouse.triangular_number(1) == 1
      assert Warehouse.triangular_number(2) == 3
      assert Warehouse.triangular_number(3) == 6
      assert Warehouse.triangular_number(36) == 666
      assert Warehouse.triangular_number(100_000) == 5_000_050_000
    end
  end

  describe "fast_triangular_number/1" do
    test "returns the correct number" do
      assert Warehouse.fast_triangular_number(1) == 1
      assert Warehouse.fast_triangular_number(2) == 3
      assert Warehouse.fast_triangular_number(3) == 6
      assert Warehouse.fast_triangular_number(36) == 666
      assert Warehouse.fast_triangular_number(100_000) == 5_000_050_000
    end
  end

  import ExUnit.CaptureIO

  describe "stretch_goal/2" do
    test "returns the correct number" do
      assert Warehouse.stretch_goal(100_000, 6_436_088_697) == 13_457
      assert Warehouse.stretch_goal(1, 1) == 1
      assert Warehouse.stretch_goal(100_000, 19_999_800_001) == 100_000

      io_output = capture_io(fn -> Warehouse.stretch_goal(99_999, 19_999_800_001) end)
      expected = "There is no x such that when y is 99999 the ID is 19999800001\n"
      assert io_output == expected
    end
  end
end
