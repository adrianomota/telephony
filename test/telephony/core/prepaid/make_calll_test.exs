defmodule Telephony.Core.Subscriber.Prepaid.MakeCallTest do
  use ExUnit.Case
  alias Telephony.Core.{Call, Prepaid, Subscriber}
  alias Telephony.Core.Prepaid.MakeCall

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
      susbscriber_making_call = MakeCall.call(subscriber, time_spent, date)

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

    test "When the subscriber doesn't credit to spend, return error", %{subscriber: subscriber} do
      %{subscriber_type: subscriber_type} = subscriber
      subscriber_type = %{subscriber_type | credits: 0}
      subscriber = %{subscriber | subscriber_type: subscriber_type}

      time_spent = 2
      date = NaiveDateTime.utc_now()
      result = Prepaid.MakeCall.call(subscriber, time_spent, date)
      expect = {:error, "Subscriber doesn't have credits"}
      assert expect == result
    end
  end
end
