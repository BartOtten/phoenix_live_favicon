defmodule Phx.Live.Favicon.MixProject do
  use Mix.Project

  def project do
    [
      name: "Phoenix Live Favicon",
      description: "Favicon manipulation for Phoenix Live Views",
      app: :phoenix_live_favicon,
      version: "0.2.0",
      package: package(),
      aliases: aliases(),
      elixir: "~> 1.10",
      docs: docs(),
      deps: deps(Mix.env()),
      source_url: "https://github.com/BartOtten/phoenix_live_favicon/",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
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
      {:phoenix_live_head, "~> 0.2.0"},
      {:ex_doc, "~> 0.27", only: [:dev, :test], runtime: false},
      {:makeup_diff, "~> 0.1.0", only: [:dev, :test]},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.14", only: :test}
    ]
  end

  defp aliases do
    [docs: ["docs", &copy_images/1]]
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
        "GUIDES.md",
        "CHANGELOG.md",
        "CONTRIBUTING.md": [filename: "contributing", title: "Contributing"],
        "LICENSE.md": [filename: "license", title: "License"]
      ]
    ]
  end

  defp copy_images(_) do
    File.cp_r("doc_assets", "doc")
  end
end
