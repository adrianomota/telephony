defmodule Telephony.Core.Prepaid do
  @keys [:credits, :recharges]
  @enforce_keys @keys
  defstruct @keys
end
