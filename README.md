# gen_tcp accept and close

Simple gen_tcp server that accepts and immediately closes connections ignoring any data sent.

## Installation

Add `gen_tcp_accept_and_close` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gen_tcp_accept_and_close, "~> 0.1.0"}
  ]
end
```

## Configuration

To change the port or listening ip, add these to your `config.exs`

```elixir
config :gen_tcp_accept_and_close, port: 4000
config :gen_tcp_accept_and_close, ip: {0, 0, 0, 0}
```
