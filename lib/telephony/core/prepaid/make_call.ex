defmodule Telephony.Core.Prepaid.MakeCall do
  alias Telephony.Core.{Call, Prepaid}
  @price_per_minute 1.45

  def call(subscriber, time_spent, date) do
    case has_credit?(subscriber, time_spent) do
      true ->
        subscriber
        |> update_credit_spent(time_spent)
        |> add_new_call(time_spent, date)

      _ ->
        {:error, "Subscriber doesn't have credits"}
    end
  end

  defp update_credit_spent(%{subscriber_type: subscriber_type} = subscriber, time_spent) do
    credit_spent = @price_per_minute * time_spent
    subscriber_type = %{subscriber_type | credits: subscriber_type.credits - credit_spent}
    %{subscriber | subscriber_type: subscriber_type}
  end

  defp add_new_call(subscriber, time_spent, date) do
    call = Call.new(time_spent, date)
    %{subscriber | calls: subscriber.calls ++ [call]}
  end

  defp has_credit?(%{subscriber_type: subscriber_type}, time_spent) do
    %Prepaid{credits: credits} = subscriber_type
    credits >= @price_per_minute * time_spent
  end
end
