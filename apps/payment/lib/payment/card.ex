defmodule Payment.Card do
  alias __MODULE__

  defstruct [:id, :three_d_secure]

  def three_d_secured_types(), do: [:required, :recommended, :optional, :not_supported]
end
