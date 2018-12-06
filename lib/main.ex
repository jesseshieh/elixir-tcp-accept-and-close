defmodule Main do
  use Application

  def start(_type, _args) do
    children = [AcceptClose]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
