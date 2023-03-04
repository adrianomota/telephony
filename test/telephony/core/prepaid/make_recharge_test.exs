defmodule Telephony.Core.Subscriber.Prepaid.MakeRechargeTest do
  use ExUnit.Case
  alias Telephony.Core.{Call, Prepaid, Recharge, Subscriber}
  alias Telephony.Core.Prepaid.Recharge.MakeRecharge

  setup do
    subscriber = %Subscriber{
      id: nil,
      full_name: "Subscriber Prepaid Recharged",
      phone_number: "+5501100000002",
      subscriber_type: %Prepaid{
        credits: 10,
        recharges: []
      },
      calls: []
    }

    %{subscriber: subscriber}
  end

  describe "call/1" do
    test "When all the params it's valid, make a recharge", %{subscriber: subscriber} do
      value = 100
      date = NaiveDateTime.utc_now()
      susbscriber_making_call = MakeRecharge.call(subscriber, value, date)

      expected = %Subscriber{
        id: nil,
        full_name: "Subscriber Prepaid Recharged",
        phone_number: "+5501100000002",
        subscriber_type: %Prepaid{
          credits: 110,
          recharges: [
            %Recharge{value: 100, date: date}
          ]
        },
        calls: []
      }

      assert susbscriber_making_call == expected
    end
  end
end
