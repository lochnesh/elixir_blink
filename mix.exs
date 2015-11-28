defmodule ElixirBlink.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixir_blink,
      version: "0.0.1",
      elixir: "~> 1.1",
      deps: deps ]
  end

  def application do
    []
  end

  defp deps do
    [
      { :mock, github: "jjh42/mock" },
      {:credo, "~> 0.1.9", only: [:dev, :test]}
    ]
  end
end
