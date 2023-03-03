defmodule Telephony.Core.Call do
  @keys [:time_spent, :date]
  @enforce_keys @keys
  defstruct @keys

  def new(time_spent, date), do: %__MODULE__{time_spent: time_spent, date: date}
end
