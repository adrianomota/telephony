defmodule Telephony.Core.Subscriber.Create do
  alias Telephony.Core.{Pospaid, Prepaid, Subscriber}

  def call(%{subscriber_type: :prepaid} = payload) do
    payload = %{payload | subscriber_type: %Prepaid{credits: 0, recharges: []}}
    struct(Subscriber, payload)
  end

  def call(%{subscriber_type: :pospaid} = payload) do
    payload = %{payload | subscriber_type: %Pospaid{spent: 0}}
    struct(Subscriber, payload)
  end
end
