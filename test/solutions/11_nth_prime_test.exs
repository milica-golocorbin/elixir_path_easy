defmodule Solutions.NthPrimeTest do
  use ExUnit.Case

  alias Solutions.NthPrime

  test "first prime" do
    assert NthPrime.nth(1) == 2
  end

  @tag :pending
  test "second prime" do
    assert NthPrime.nth(2) == 3
  end

  @tag :pending
  test "sixth prime" do
    assert NthPrime.nth(6) == 13
  end

  @tag :pending
  test "100th prime" do
    assert NthPrime.nth(100) == 541
  end

  @tag :pending
  @tag :slow
  test "big prime" do
    assert NthPrime.nth(10001) == 104_743
  end

  @tag :pending
  test "there is no zeroth prime" do
    catch_error(NthPrime.nth(0))
  end
end
