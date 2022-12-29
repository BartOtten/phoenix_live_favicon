defmodule Phx.Live.Favicon.MixProject do
  use Mix.Project

  def project do
    [
      name: "Phoenix Live Favicon",
      description: "Favicon manipulation for Phoenix Live Views",
      app: :phoenix_live_favicon,
      version: "0.1.1",
      package: package(),
      aliases: aliases(),
      elixir: "~> 1.10",
      docs: docs(),
      deps: deps(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps(_) do
    [
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:phoenix_live_head, "~> 0.1.2"}
    ]
  end

  defp aliases do
    []
  end

  defp package do
    [
      maintainers: ["Bart Otten"],
      licenses: ["MIT"],
      links: %{
        Changelog: "https://hexdocs.pm/phoenix_live_favicon/changelog.html",
        GitHub: "https://github.com/BartOtten/phoenix_live_favicon"
      }
    ]
  end

  defp docs do
    [
      api_reference: false,
      authors: ["Bart Otten"],
      main: "readme",
      extras: [
        "README.md",
        "CHANGELOG.md",
        "CONTRIBUTING.md": [filename: "contributing", title: "Contributing"],
        "LICENSE.md": [filename: "license", title: "License"]
      ]
    ]
  end
end
