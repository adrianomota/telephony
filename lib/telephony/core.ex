defmodule Telephony.Core do
  alias Telephony.Core.Subscriber.Create
  # @subscriber_types [:pre_paid, :post_paid]
  @subscriber_types ~w/pre_paid post_paid/a

  def create_subscriber(subscribers, %{subscriber_type: subscriber_type} = payload)
      when subscriber_type in @subscriber_types do
    case Enum.find(subscribers, &(&1.phone_number == payload.phone_number)) do
      nil ->
        subscriber = Create.call(payload)
        subscribers ++ [subscriber]

      subscriber ->
        {:error, "Subscriber '#{subscriber.phone_number}' already exists"}
    end
  end

  def create_subscriber(_subscribers, _payload),
    do: {:error, "Only 'pre_paid' or 'post_paid' are accepted"}
end
