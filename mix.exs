defmodule LogBench.MixProject do
  use Mix.Project

  def project do
    [
      app: :log_bench,
      version: "0.1.0",
      elixir: "~> 1.7-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :lager_x]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:benchee, "~> 0.13", only: :dev},
      {:lager_x, "~> 0.14.2"}
    ]
  end
end
