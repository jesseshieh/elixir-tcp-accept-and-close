defmodule GenTcpAcceptAndClose.Server do
  use GenServer
  require Logger

  # from https://medium.com/blackode/quick-easy-tcp-genserver-with-elixir-and-erlang-10189b25e221
  def start_link(_) do
    ip = Application.get_env(:gen_tcp_accept_and_close, :ip, {0, 0, 0, 0})
    port = Application.get_env(:gen_tcp_accept_and_close, :port, 4000)
    Logger.debug "[gen_tcp_accept_and_close] Starting #{__MODULE__} listening on #{to_string(:inet_parse.ntoa(ip))}:#{port}"
    GenServer.start_link(__MODULE__, [ip, port], [])
  end

  def init([ip, port]) do
    {:ok, listen_socket} =
      :gen_tcp.listen(port, [:binary, {:packet, 0}, {:active, false}, {:ip, ip}])

    {:ok, {listen_socket}, 0}
  end

  def handle_info(:timeout, {listen_socket}) do
    # accept and close right away ignoring whatever data is sent.
    {:ok, socket} = :gen_tcp.accept(listen_socket)
    Logger.debug "[gen_tcp_accept_and_close] Accepting and closing connection"
    :ok = :gen_tcp.close(socket)

    # create an infinite loop
    Process.send_after(self(), :timeout, 0)
    {:noreply, {listen_socket}}
  end
end
