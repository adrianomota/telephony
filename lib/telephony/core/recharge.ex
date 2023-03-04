defmodule Telephony.Core.Recharge do
  @keys [:value, :date]
  @enforce_keys @keys
  defstruct @keys
end
