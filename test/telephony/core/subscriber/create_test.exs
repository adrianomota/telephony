defmodule Telephony.Core.Subscriber.CreateTest do
  use ExUnit.Case
  alias Telephony.Core.{Pospaid, Prepaid, Subscriber, Subscriber.Create}

  describe "call/1" do
    test "When all the params it's valid, create prepaid subscriber" do
      subscriber_fixtures = %{
        full_name: "Subscriber Prepaid one",
        phone_number: "+5501199993333",
        subscriber_type: :prepaid
      }

      susbscriber_created = Create.call(subscriber_fixtures)

      expected = %Subscriber{
        id: nil,
        full_name: "Subscriber Prepaid one",
        phone_number: "+5501199993333",
        subscriber_type: %Prepaid{credits: 0, recharges: []}
      }

      assert expected == susbscriber_created
    end

    test "When all the params it's valid, create pospaid subscriber" do
      subscriber_fixtures = %{
        full_name: "Subscriber Pospaid one",
        phone_number: "+5501199993340",
        subscriber_type: :pospaid
      }

      susbscriber_created = Create.call(subscriber_fixtures)

      expected = %Subscriber{
        id: nil,
        full_name: "Subscriber Pospaid one",
        phone_number: "+5501199993340",
        subscriber_type: %Pospaid{spent: 0}
      }

      assert expected == susbscriber_created
    end
  end
end
