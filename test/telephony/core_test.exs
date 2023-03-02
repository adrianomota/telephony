defmodule Telephony.Core.CoreTest do
  use ExUnit.Case
  alias Telephony.Core
  alias Telephony.Core.Subscriber

  setup do
    subscribers = [
      %Subscriber{
        id: nil,
        full_name: "Subscriber one",
        phone_number: "+5501199993331",
        subscriber_type: :pre_paid
      }
    ]

    payload = %{
      full_name: "The new subscriber",
      phone_number: "+5501199993332",
      subscriber_type: :pre_paid
    }

    %{subscribers: subscribers, payload: payload}
  end

  describe "create_subscriber/2" do
    test "When all the params are valid, create the subscriber and add the list", %{
      subscribers: subscribers,
      payload: payload
    } do
      count_subscribers = Core.create_subscriber(subscribers, payload)

      assert Enum.count(count_subscribers) > 0
    end

    test "When subscribers already exists, return error", %{
      subscribers: subscribers,
      payload: payload
    } do
      payload = Map.put(payload, :phone_number, "+5501199993331")
      result = Core.create_subscriber(subscribers, payload)
      assert {:error, "Subscriber '#{payload.phone_number}' already exists"} == result
    end

    test "When subscribers type doesn't exists, return error", %{
      payload: payload
    } do
      payload = Map.put(payload, :subscriber_type, :any_type)
      result = Core.create_subscriber([], payload)
      assert {:error, "Only 'pre_paid' or 'post_paid' are accepted"} == result
    end
  end
end
