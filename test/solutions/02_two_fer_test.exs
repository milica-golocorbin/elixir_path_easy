defmodule Solutions.TwoFerTest do
  use ExUnit.Case

  alias Solutions.TwoFer

  test "no name given" do
    assert TwoFer.two_fer() == "One for you, one for me."
  end

  test "name given" do
    assert TwoFer.two_fer("Alice") == "One for Alice, one for me."
  end

  test "another name given" do
    assert TwoFer.two_fer("Bob") == "One for Bob, one for me."
  end

  test "raise error when argument is a wrong type" do
    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(10)
    end

    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(:Alice)
    end

    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer('Alice')
    end
  end
end
