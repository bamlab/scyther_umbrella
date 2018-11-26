defmodule Payment.CardToken do
  alias __MODULE__

  @enforce_keys [:token]
  defstruct [:token]

  def new(token) when is_bitstring(token), do: {:ok, %CardToken{token: token}}

  def new(_token), do: {:error, :invalid_token}
end
