defmodule Telephony.Core.Prepaid.Recharge.MakeRecharge do
  alias Telephony.Core.Recharge

  def call(%{subscriber_type: subscriber_type} = subscriber, value, date) do
    recharge = struct(Recharge, %{value: value, date: date})

    subscriber_type = %{
      subscriber_type
      | recharges: subscriber_type.recharges ++ [recharge],
        credits: subscriber_type.credits + value
    }

    %{subscriber | subscriber_type: subscriber_type}
  end
end
