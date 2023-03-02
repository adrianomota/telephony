defmodule Telephony.Core.Subscriber.CreateTest do
  use ExUnit.Case
  alias Telephony.Core.Subscriber
  alias Telephony.Core.Subscriber.Create

  describe "call/1" do
    test "When all the params it's valid, create de subscriber" do
      subscriber_fixtures = %{
        full_name: "Subscriber one",
        phone_number: "+5501199993333",
        subscriber_type: :pre_paid
      }

      susbscriber_created = Create.call(subscriber_fixtures)

      expected = %Subscriber{
        id: nil,
        full_name: "Subscriber one",
        phone_number: "+5501199993333",
        subscriber_type: :pre_paid
      }

      assert expected == susbscriber_created
    end
  end
end
