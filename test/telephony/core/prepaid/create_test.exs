defmodule Telephony.Core.Subscriber.PrepaidTest do
  use ExUnit.Case
  alias Telephony.Core.{Call, Prepaid, Subscriber}
  alias Telephony.Core.Prepaid.Create

  setup do
    subscriber = %Subscriber{
      id: nil,
      full_name: "Subscriber Prepaid one",
      phone_number: "+5501100000001",
      subscriber_type: %Prepaid{credits: 10, recharges: []},
      calls: []
    }

    %{subscriber: subscriber}
  end

  describe "call/1" do
    test "When all the params it's valid, make a call", %{subscriber: subscriber} do
      time_spent = 2
      date = NaiveDateTime.utc_now()
      susbscriber_making_call = Create.call(subscriber, time_spent, date)

      expected = %Subscriber{
        id: nil,
        full_name: "Subscriber Prepaid one",
        phone_number: "+5501100000001",
        subscriber_type: %Prepaid{credits: 7.1, recharges: []},
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
