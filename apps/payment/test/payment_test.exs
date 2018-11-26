defmodule PaymentTest do
  use ExUnit.Case
  doctest Payment

  test "greets the world" do
    assert Payment.hello() == :world
  end
end
