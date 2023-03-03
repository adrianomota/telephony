defmodule Telephony.Core.Subscriber do
  @keys [:id, :full_name, :phone_number, :subscriber_type, :calls]
  @enforce_keys @keys
  defstruct @keys
end
