defmodule Telephony.Core.Subscriber.Create do
  alias Telephony.Core.Subscriber

  def call(params) do
    struct(Subscriber, params)
  end
end
