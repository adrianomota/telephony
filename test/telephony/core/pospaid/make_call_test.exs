defmodule Telephony.Core.Pospaid.MakeCallTest do
  use ExUnit.Case
  alias Telephony.Core.{Call, Pospaid, Subscriber}
  alias Telephony.Core.Pospaid.MakeCall

  setup do
    subscriber = %Subscriber{
      id: nil,
      full_name: "Subscriber Pospaid one",
      phone_number: "+5501100000001",
      subscriber_type: %Pospaid{spent: 0},
      calls: []
    }

    %{subscriber: subscriber}
  end

  describe "call/1" do
    test "When all the params it's valid, make a call", %{subscriber: subscriber} do
      time_spent = 2
      date = NaiveDateTime.utc_now()
      susbscriber_making_call = MakeCall.call(subscriber, time_spent, date)

      expected = %Subscriber{
        id: nil,
        full_name: "Subscriber Pospaid one",
        phone_number: "+5501100000001",
        subscriber_type: %Pospaid{
          spent: 2.08
        },
        calls: [
          %Call{
            time_spent: 2,
            date: date
          }
        ]
      }

      assert susbscriber_making_call == expected
    end
  end
end
