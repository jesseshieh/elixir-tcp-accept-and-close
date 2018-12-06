defmodule GenTcpAcceptAndClose.MixProject do
  use Mix.Project

  def project do
    [
      app: :gen_tcp_accept_and_close,
      version: "0.1.0",
      description: "Simple gen_tcp server that accepts and immediately closes connections ignoring any data sent.",
      package: package(),
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {GenTcpAcceptAndClose.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package() do
    [
      name: "gen_tcp_accept_and_close",
      files: ~w(lib mix.exs README.md LICENSE.md),
      maintainers: ["Jesse Shieh"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jesseshieh/elixir-tcp-accept-and-close"}
    ]
  end
end
