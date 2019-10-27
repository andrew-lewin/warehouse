defmodule WarehouseTest do
  use ExUnit.Case
  doctest Warehouse

  import ExUnit.CaptureIO

  describe "answer/2" do
    test "returns the correct number on the lower bound" do
      assert Warehouse.answer(1, 1) == "1"
    end

    test "returns the correct number on the upper bound" do
      assert Warehouse.answer(100_000, 100_000) == "19999800001"
    end

    test "returns the correct result with [2, 2]" do
      assert Warehouse.answer(2, 2) == "5"
    end

    test "returns the correct result with [2, 4]" do
      assert Warehouse.answer(2, 4) == "12"
    end

    test "returns the correct result with [4, 1]" do
      assert Warehouse.answer(4, 1) == "10"
    end

    test "returns the correct result with [4, 2]" do
      assert Warehouse.answer(4, 2) == "14"
    end

    test "returns the correct result with [612, 231]" do
      assert Warehouse.answer(612, 231) == "354673"
    end

    test "returns the correct result with [11111, 11111]" do
      assert Warehouse.answer(11_111, 11_111) == "246886421"
    end

    test "returns an error message when x is below the allowed bounds" do
      io_output = capture_io(fn -> Warehouse.answer(0, 1) end)
      expected = "x and y must be between 1 and 100,000. x: 0, y: 1\n"
      assert io_output == expected
    end

    test "returns an error message when x is above the allowed bounds" do
      io_output = capture_io(fn -> Warehouse.answer(100_001, 1) end)
      expected = "x and y must be between 1 and 100,000. x: 100001, y: 1\n"
      assert io_output == expected
    end

    test "returns an error message when y is below the allowed bounds" do
      io_output = capture_io(fn -> Warehouse.answer(1, 0) end)
      expected = "x and y must be between 1 and 100,000. x: 1, y: 0\n"
      assert io_output == expected
    end

    test "returns an error message when y is above the allowed bounds" do
      io_output = capture_io(fn -> Warehouse.answer(1, 100_001) end)
      expected = "x and y must be between 1 and 100,000. x: 1, y: 100001\n"
      assert io_output == expected
    end
  end

  describe "triangular_number/1" do
    test "returns the correct number with the lower bound" do
      assert Warehouse.triangular_number(1) == 1
    end

    test "returns the correct number with the upper bound" do
      assert Warehouse.triangular_number(100_000) == 5_000_050_000
    end

    test "returns the correct number with 2" do
      assert Warehouse.triangular_number(2) == 3
    end

    test "returns the correct number with 3" do
      assert Warehouse.triangular_number(3) == 6
    end

    test "returns the correct number with 36" do
      assert Warehouse.triangular_number(36) == 666
    end
  end

  describe "fast_triangular_number/1" do
    test "returns the correct number with the lower bound" do
      assert Warehouse.fast_triangular_number(1) == 1
    end

    test "returns the correct number with the upper bound" do
      assert Warehouse.fast_triangular_number(100_000) == 5_000_050_000
    end

    test "returns the correct number with 2" do
      assert Warehouse.fast_triangular_number(2) == 3
    end

    test "returns the correct number with 3" do
      assert Warehouse.fast_triangular_number(3) == 6
    end

    test "returns the correct number with 36" do
      assert Warehouse.fast_triangular_number(36) == 666
    end
  end

  describe "stretch_goal/2" do
    test "returns the correct number on the lower bound" do
      assert Warehouse.stretch_goal(1, 1) == 1
    end

    test "returns the correct number on the upper bound" do
      assert Warehouse.stretch_goal(100_000, 19_999_800_001) == 100_000
    end

    test "returns the correct number with [x, 100000] = 6436088697" do
      assert Warehouse.stretch_goal(100_000, 6_436_088_697) == 13_457
    end

    test "returns an error message if there isn't an x to satisfy the y and id conditions" do
      io_output = capture_io(fn -> Warehouse.stretch_goal(99_999, 19_999_800_001) end)
      expected = "There is no x such that when y is 99999 the ID is 19999800001\n"
      assert io_output == expected
    end
  end
end
